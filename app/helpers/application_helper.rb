module ApplicationHelper
  
  def gravatar_for(user, options = { size: 40 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size] # Ensure size is taken from options

    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
    
    # Conditional Logic: Fallback to email if name is not present
    image_tag(gravatar_url, alt: user.name.presence || user.email, class: "gravatar rounded-circle", style: "width: #{size}px; height: #{size}px;")
  end

end
