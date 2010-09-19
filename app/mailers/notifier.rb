class Notifier < ActionMailer::Base
  default_url_options[:host] = "localhost:3000"
  default :from => "The Notifier <noreply@nowhere.com>"

  def password_instructions(user)
    @reset_url = reset_url(user.perishable_token)
    mail(:to => user.email, :subject => "Reset Password Instructions")
  end

  def activation_instructions(user)
    @activation_url = activate_url(user.perishable_token)
    mail(:to => user.email, :subject => "Activation Instructions")
  end
end
