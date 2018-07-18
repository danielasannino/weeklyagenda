module ApplicationHelper
  def bootstrap_class_for flash_type
    case flash_type
    when "success"
      "alert-success" # Green
    when "error"
      "alert-danger" # Red
    when "alert"
      "alert-warning" # Yellow
    when "notice"
      "alert-info" # Blue
    else
      flash_type.to_s
    end
  end

 def gravatar_url(email, size)
    gravatar = Digest::MD5::hexdigest(email).downcase
    url = "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end
end
