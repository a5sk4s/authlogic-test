Factory.define :valid_user, :class => User do |u|
  u.email "the.user@nowhere.com"
  u.password "aB3!!3r0ne"
  u.password_confirmation "aB3!!3r0ne"
  u.activated_at Time.local(2010, 12, 13)
end

Factory.define :user_wo_email, :class => User do |u|
  u.password "thepassword"
  u.password_confirmation "thepassword"
end

Factory.define :user_wo_password, :class => User do |u|
  u.email "the.user@nowhere.com"
  u.password_confirmation "password"
end

Factory.define :user_wo_confirmation, :class => User do |u|
  u.email "the.user@nowhere.com"
  u.password "thepassword"
end

Factory.define :user_wo_matching_confirmation, :class => User do |u|
  u.email "the.user@nowhere.com"
  u.password "thepassword"
  u.password_confirmation "notthepassword"
end

Factory.define :user_wo_strong_password, :class => User do |u|
  u.email "the.user@nowhere.com"
  u.password "t00weak"
  u.password_confirmation "t00weak"
end
