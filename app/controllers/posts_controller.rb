
class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :archive]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if current_user.admin?
      if params[:type] == "user"
        if params[:most]
          @pagy, @res = pagy_countless(User.joins(:posts).distinct.select('users.*, COUNT(posts.reacts_count) AS user_reacts_count').group('id').order(user_reacts_count: :desc).includes(avatar_attachment: :blob), items: 10)
        else
          @pagy, @res = pagy_countless(User.all.includes(avatar_attachment: :blob), items:10)
        end
      else
        if params[:most]
          @pagy, @res = pagy_countless(Post.published.order(reacts_count: :desc).includes({user: {avatar_attachment: :blob}}, :categories), items: 10)
        elsif params[:status].present? && Post.statuses.keys.include?(params[:status])
          @pagy, @res = pagy_countless(Post.send(params[:status]).includes({user: {avatar_attachment: :blob}}, :categories), items:10)
        else
          @pagy, @res = pagy_countless(Post.all.includes({user: {avatar_attachment: :blob}}, :categories), items:10)
        end
      end
    else
      if params[:most]
        @pagy, @posts = pagy_countless(current_user.posts.published.order(reacts_count: :desc), items: 10)
      elsif params[:status].present? && Post.statuses.keys.include?(params[:status])
        @pagy, @posts = pagy_countless(current_user.posts.send(params[:status]).includes(:categories), items:10)
      else
        @pagy, @posts = pagy_countless(current_user.posts.includes(:categories), items:10)
      end
    end
  end

  def new
    @post = Post.create(title: "Untitled", status: :draft, user_id: current_user.id)
    redirect_to edit_post_path(@post)
  end

  def edit
    @categories = Category.all
    render layout: "without_create_post" 
  end

  def destroy
    if @post.destroy
      redirect_to user_path(current_user)
    end
  end
  
  def update
    case params[:status]
    when "pending"
      @post.status = :pending
      @post.assign_attributes(post_params)
      @post.cover.attach(post_params[:cover]) if post_params[:cover].present?
      if @post.save
        Notification.create(sender_id: @post.user.id, receiver_id: User.admin[0].id, action: :post, content: "#{@post.user.name} has made a post " +  "#{@post.categories.first&.name}", post_id: @post.id, seen: false)
        respond_to do |format|
          format.js {
            render js: "window.location='#{posts_path}'"
          }
        end
      end
    when "published"
      @post.status = params[:status]
      if Post.find(params[:id]).user.admin?
        @post.assign_attributes(post_params)
        @post.cover.attach(post_params[:cover]) if post_params[:cover].present?
      end
      if @post.save 
        CreateNotificationJob.perform_later(@post, current_user)
        respond_to do |format|   
          format.js {
            render js: "window.location='#{post_path(@post)}'"
          }
        end
      end
    when "declined"
      @post.status = params[:status]
      if @post.save
        Notification.create(sender_id: current_user.id, receiver_id: @post.user.id, action: :post, content: "Admin has declined a post " +  "#{@post.categories&.first.name}", post_id: @post.id)
        respond_to do |format|
          format.js {
            render js: "window.location='#{posts_path}'"
          }
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
    @comments = @post.comments.includes(user: {avatar_attachment: :blob}, comments: [:user, :comments]).order(created_at: :desc)
    if params[:notification_id]
      notification = Notification.find(params[:notification_id])
      notification.seen = true
      notification.save
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
