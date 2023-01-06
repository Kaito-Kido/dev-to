module PostsHelper
  def date_created_at(object)
    object.created_at.strftime("%d %b %Y")
  end
end
