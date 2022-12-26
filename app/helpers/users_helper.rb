module UsersHelper



  def avatar_when_comment
    if user_signed_in?
      current_user.avatar
    else
      "https://res.cloudinary.com/practicaldev/image/fetch/s--RmY55OKL--/c_limit,f_auto,fl_progressive,q_auto,w_256/https://practicaldev-herokuapp-com.freetls.fastly.net/assets/devlogo-pwa-512.png"
    end
  end
end
