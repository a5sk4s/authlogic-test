class UserSession < Authlogic::Session::Base
  # TBD - investigate why this is needed for rspec2
  extend ActiveModel::Naming

  generalize_credentials_error_messages true
  logout_on_timeout true
  consecutive_failed_logins_limit 2
  failed_login_ban_for 2.minutes
end