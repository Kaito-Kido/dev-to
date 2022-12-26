module UsersHelper
  def name_of_user(user)
    if user_signed_in?
      if user.name.nil?
        "username#{user.id}"
      else
        user.name
      end
    end
  end

  def avatar(user)
    if user.avatar.attached?
      user.avatar
    else
      "https://st4.depositphotos.com/4329009/19956/v/600/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg"
    end    
  end


  def avatar_when_comment
    if user_signed_in?
      avatar(current_user)
    else
      "https://res.cloudinary.com/practicaldev/image/fetch/s--RmY55OKL--/c_limit,f_auto,fl_progressive,q_auto,w_256/https://practicaldev-herokuapp-com.freetls.fastly.net/assets/devlogo-pwa-512.png"
    end
  end
end
