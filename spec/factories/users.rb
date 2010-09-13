Factory.define :valid_user, :class => User do |u|
  u.email "the.user@nowhere.com"
  u.password "thepassword"
  u.password_confirmation "thepassword"
end

Factory.define :user_wo_email, :class => User do |u|
  u.email ""
  u.password "thepassword"
  u.password_confirmation "thepassword"
end

Factory.define :user_wo_password, :class => User do |u|
  u.email "the.user@nowhere.com"
  u.password ""
  u.password_confirmation "password"
end

Factory.define :user_wo_confirmation, :class => User do |u|
  u.email "the.user@nowhere.com"
  u.password "thepassword"
  u.password_confirmation ""
end

Factory.define :user_wo_matching_confirmation, :class => User do |u|
  u.email "the.user@nowhere.com"
  u.password "thepassword"
  u.password_confirmation "anotherpassword"
end