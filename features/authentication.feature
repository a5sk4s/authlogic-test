Feature: A valid user should be able to authenticate with the site

  As a valid user
  I want to log in
  So that I can use the features on the site
  
  Scenario: A user should be able to get to the login page
    Given a registered user "bob@nowhere.com" with password "Sup3rS3cr3!"
    When I go to the homepage
    Then I should see "AuthlogicExample"
    When I follow "Login"
    Then I am on the login page
    
  Scenario: A registered user can login and be directed to their profile page
    Given a registered user "bob@nowhere.com" with password "Sup3rS3cr3!"
    When I go to the login page
    And I fill in "Email" with "bob@nowhere.com"
    And I fill in "Password" with "Sup3rS3cr3!"
    And I press "Login"
    Then I should see "bob@nowhere.com"

  Scenario: A registered user should be able to logout
    Given a logged in user "bob@nowhere.com"
    When I go to the logout page
    Then I should see "Logout successful."
    
  Scenario: A logged in user on the login page should just redirect to their profile page
    Given a logged in user "bob@nowhere.com"
    When I go to the login page
    Then I should see "bob@nowhere.com"
    
  Scenario: A logged in user should be able to logout
    Given a logged in user "bob@nowhere.com"
    # And I am on my profile page
    And I am on the profile page for "bob@nowhere.com"
    When I follow "Logout"
    Then I should see "Logout successful."
    
  Scenario Outline: A registered user that types in the wrong password can not login
    Given a registered user "bob@nowhere.com" with password "Sup3rS3cr3!"
    When I go to the login page
    And I fill in "Email" with "<email>"
    And I fill in "Password" with "<password>"
    And I press "Login"
    Then I should see "Credentials are not valid."
    
    Examples:
      |email|password|
      |bob@nowhere.com| |
      | |Sup3rS3cr3!|
      | | |
      |bbo@nowhere.com|Sup3rS3cr3!|
      |bob@nowhere.com|S3cr3!|

  Scenario Outline: An unauthenticated user should be shown the login page for protected pages
    Given a registered user "bob@nowhere.com" with password "Sup3rS3cr3!"
    When I go to <page>
    Then I should see "You must be logged in to access this page."

    Examples:
      |page|
      |the users page|
