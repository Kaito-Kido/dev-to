class PopulatePostReactsCount < ActiveRecord::Migration[6.1]
  def change
    Post.find_each do |post|
      Post.reset_counters(post.id, :reacts)
    end
  end
end
