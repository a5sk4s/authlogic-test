Given /^no registered users$/ do
  User.delete_all
end

Given /^a registered user "([^\"]*)"$/ do |login|
  Factory.create(:valid_user, :email => login)
end

Given /^a registered user "([^\"]*)" with password "([^\"]*)"$/ do |login, password|
  User.delete_all
  Factory.create(:valid_user, :email => login, :password => password, :password_confirmation => password)
end