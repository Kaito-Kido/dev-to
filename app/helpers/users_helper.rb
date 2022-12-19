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
    if user.avatar.present?
      user.avatar
    else
      "https://res.cloudinary.com/practicaldev/image/fetch/s--AqDMneXM--/c_fill,f_auto,fl_progressive,h_90,q_auto,w_90/https://dev-to-uploads.s3.amazonaws.com/uploads/user/profile_image/698413/b3883b82-8e7a-4066-a100-b4281adc4863.jpeg"
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
