module MainHelper
  def contact_avatar(contact, options = {})
    if contact.image.nil?
      image_tag contact.avatar_url, options
    else
      image_tag contact.image.thumb('150x150#').url, options
    end
  end
end

