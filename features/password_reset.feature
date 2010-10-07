Feature: User should be able to reset their password

  As a user that forgot the password
  I want be able to reset my password
  So that I can use the features on the site
  
  Scenario: A registered user that forgot his password should be able to reset it
    Given a registered user "bob@nowhere.com" with password "Sup3rS3cr3!"
    When I go to the login page
    And I follow "Forgot Password"
    And I fill in "Email" with "bob@nowhere.com"
    And I press "Reset"
    Then I should see "Instructions to reset your password have been emailed to you."
    And I should receive an email
    When I open the email
    Then I should see "Reset Password Instructions" in the email subject
    When I click the first link in the email
    Then I should see "Reset Password"
    And I fill in "Password" with "S3cr3!"
    And I fill in "Password confirmation" with "S3cr3!"
    And I press "Reset"
    Then I should see "Password updated"
    And I should see "bob@nowhere.com"
    
  Scenario: A user must have a valid token to reset their password
    Given no registered users
    When I go to the password reset page with an invalid token
    Then I should see "sorry"