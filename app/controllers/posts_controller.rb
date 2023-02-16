class PostsController < ApplicationController
  before_action :set_post, except: %i[index new]
  before_action :authenticate_user!, except: [:show]

  def index
    if current_user.admin?
      if params[:type] == 'chart'
        top_author = User.joins(:posts).distinct.select('users.*, SUM(posts.reacts_count) AS user_reacts_count').group('id').order(user_reacts_count: :desc).limit(10)
        @top_author = {}
        top_author.each do |r|
          @top_author[r.name.to_s] = r.user_reacts_count
        end
        @status = Post.pluck(:status)
        @created_post_in_week = Post.group_by_day(:created_at).count
      elsif params[:type] == 'user'
        if params[:most]
          @pagy, @res = pagy_countless(
            User.joins(:posts).distinct.select('users.*, SUM(posts.reacts_count) AS user_reacts_count').group('id').order(user_reacts_count: :desc).includes(avatar_attachment: :blob), items: 10
          )
        else
          @pagy, @res = pagy_countless(User.all.includes(avatar_attachment: :blob), items: 10)
        end
      else
        if params[:most]
          @pagy, @res = pagy_countless(
            Post.published.order(reacts_count: :desc).includes({ user: { avatar_attachment: :blob } },
                                                               :categories), items: 10
          )
        elsif params[:status].present? && Post.statuses.keys.include?(params[:status])
          @pagy, @res = pagy_countless(
            Post.send(params[:status]).order(id: :desc).includes({ user: { avatar_attachment: :blob } },
                                                                 :categories), items: 10
          )
        else
          @pagy, @res = pagy_countless(
            Post.all.order(id: :desc).includes({ user: { avatar_attachment: :blob } }, :categories), items: 10
          )
        end
        render partial: 'posts/scrollable_status_posts' if params[:page]
      end
    else
      if params[:most]
        @pagy, @posts = pagy_countless(current_user.posts.published.order(reacts_count: :desc).includes([:categories]),
                                       items: 10)
      elsif params[:status].present? && Post.statuses.keys.include?(params[:status])
        @pagy, @posts = pagy_countless(current_user.posts.send(params[:status]).includes([:categories]), items: 10)
      else
        @pagy, @posts = pagy_countless(current_user.posts.includes([:categories]), items: 10)
      end
      render partial: 'posts/scrollable_status_posts' if params[:page]
    end
  end

  def new
    @post = Post.create(title: 'Untitled', status: :draft, user_id: current_user.id)
    redirect_to edit_post_path(@post)
  end

  def edit
    @categories = Category.all
    render layout: 'without_create_post'
  end

  def destroy
    return unless @post.destroy

    redirect_to user_path(current_user)
  end

  def update
    case params[:status]
    when 'pending'
      @post.status = :pending
      @post.assign_attributes(post_params)
      @post.cover.attach(post_params[:cover]) if post_params[:cover].present?
      if @post.save
        CreateNotificationJob.perform_later(post: @post, status: params[:status], action: 'post')
        respond_to do |format|
          format.js do
            render js: "window.location='#{posts_path}'"
          end
        end
      end
    when 'published'
      @post.status = params[:status]
      if Post.find(params[:id]).user.admin?
        @post.assign_attributes(post_params)
        @post.cover.attach(post_params[:cover]) if post_params[:cover].present?
      end
      if @post.save
        CreateNotificationJob.perform_later(post: @post, sender: current_user, status: params[:status], action: 'post')
        respond_to do |format|
          format.js do
            render js: "window.location='#{post_path(@post)}'"
          end
        end
      end
    when 'declined'
      @post.status = params[:status]
      if @post.save
        CreateNotificationJob.perform_later(sender: current_user, post: @post, status: params['status'], action: 'post')
        respond_to do |format|
          format.js do
            render js: "window.location='#{posts_path}'"
          end
        end
      end
    else
      @post.status = :draft
      @post.assign_attributes(post_params)
      @post.cover.attach(post_params[:cover]) if post_params[:cover].present?
      if @post.save
        respond_to do |format|
          format.js
        end
      end
    end
  end

  def show
    if params[:notification_id]
      notification = Notification.find(params[:notification_id])
      notification.seen = true
      notification.save
    end

    @pagy, @comments = pagy_countless(
      @post.comments.includes({ user: { avatar_attachment: :blob } },
                              comments: [:user, { comments: %i[user comments] }]).order(created_at: :desc), items: 5
    )
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :cover)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
