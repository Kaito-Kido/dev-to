module UsersHelper
  def name_of_user
    if current_user.name.nil?
      "username#{current_user.id}"
    else
      current_user.name
    end
  end
end
