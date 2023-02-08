module BookmarksHelper
  def bookmarked?(post)
    if user_signed_in?
      Bookmark.find_by(user: current_user, post: post)
    end
  end
end
