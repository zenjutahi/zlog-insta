module ApplicationHelper
  def avatar_url user
    require 'digest/md5'
    return user.image if user.image
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar#{gravatar_id}.jpg"
  end
end
