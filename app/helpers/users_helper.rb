module UsersHelper
  def password_meter()
    html = render :partial => 'users/password_meter'
  end

  def display(user, text)
    user == current_user ? text : truncate(text, :length => 7)
  end
end
