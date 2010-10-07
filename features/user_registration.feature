Feature: Account registration

  As an anonymous user
  I want to register
  So that I can use the features on the site
  
  Scenario: Anonymous user registering for a new account
    Given no registered users
    When I go to the registration page
    And I fill in "Email" with "bob@nowhere.com"
    And I fill in "Password" with "S3cr3!"
    And I fill in "Password confirmation" with "S3cr3!"
    And I press "Register"
    Then I should see "Account created."
    And I should receive an email
    When I open the email
    Then I should see "Activation Instructions" in the email subject
    When I click the first link in the email
    Then I should see "Activation"
    When I press "Confirm"
    Then I should see "Your account has been activated."

  Scenario: Anonymous user must enter valid data to register for an account
    Given no registered users
    When I go to the registration page
    And I fill in "Email" with "john"
    And I fill in "Password" with "S3cr3!"
    And I fill in "Password confirmation" with "not a secret"
    And I press "Register"
    Then I should see "Register"
  
