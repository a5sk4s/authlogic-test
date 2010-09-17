class Notifier < ActionMailer::Base
  default_url_options[:host] = "localhost:3000"
  default :from => "The Notifier <noreply@nowhere.com>"

  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

  def activation_instructions(user)
    subject       "Activation Instructions"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => activate_url(user.perishable_token)
  end
end
