module BookmarksHelper
  def bookmarked?(post)
    return unless user_signed_in?

    Bookmark.find_by(user: current_user, post: post)
  end
end
