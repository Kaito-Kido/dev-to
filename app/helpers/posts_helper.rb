module PostsHelper
  def date_created_at(object)
    object.created_at.strftime("%b %d")
  end

  # def like_button(post)
  #   url = post_react_path(post)
  #   if reacted?(post)
  #     link_to_with('icon-start', "Like", url,{
  #       method: 'DELETE',
  #       remote: true,
  #       class: 'react-button liked',
  #       id: "react-#{post.id}"
  #     })
  #   else
  #     link_to_with('icon-start', "Like", url,{
  #       method: 'POST',
  #       remote: true,
  #       class: 'react-button',
  #       id: "react-#{post.id}"
  #     })
  #   end
  # end

  # def link_to_with(icon_css, title, url, options = {})
  #   icon = content_tag(:i, nil, class: "liked")
  #   title_with_icon = icon << ' '.html_safe << content_tag(:p, title, class: 'react__text')
  #   link_to(title_with_icon, url, options)
  # end


  # def svg(name)
  #   file_path = "#{Rails.root}/app/assets/images/#{name}.svg"
  #   return File.read(file_path).html_safe if File.exists?(file_path)
  #   '(not found)'
  # end
end
