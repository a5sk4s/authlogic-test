Given /^a logged in user "([^\"]*)"$/ do |name|
  Given "a registered user \"#{name}\" with password \"S3cr3!\""
  Given %{"#{name}" is logged in}
end

Given /^"([^\"]*)" is logged in$/ do |name|
  When "I go to \"the login page\""
  And "I fill in \"Email\" with \"#{name}\""
  And "I fill in \"Password\" with \"S3cr3!\""
  And "I press \"Login\""
  Then "I should see \"Login successful.\""
  
  @current_user = User.find_by_email!(name)
end