Feature: Manage users
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Scenario: Register new user
    Given I am on the new user page
    When I fill in "First name" with "first_name 1"
    And I fill in "Last name" with "last_name 1"
    And I fill in "Login" with "login 1"
    And I fill in "Email" with "mariano@hotmail.com"
    And I fill in "Password" with "password 1"
    And I fill in "Password confirmation" with "password 1"
    And I fill in "Username" with "username 1"
    And I press "Sign up"
    Then I should see "You need to sign in or sign up before continuing."

  Scenario: Login
    Given a valid user
    When I go the login page
    And I fill in the following:
      |Email|mariano@hotmail.com|
      |Password|12345678|
    And I press "Sign in"
    Then I should see "Signed in successfully."


  Scenario: Delete account
    Given a logged in user
    And I follow "Edit"
    When I press "Cancel my account"
    Then I should see "You need to sign in or sign up before continuing."

  Scenario: Edit account
    Given a logged in user
    And I follow "Edit"
    And I should see "First name"
    And I should see "Last name"
    And I should see "Email"
    And I should not see "Username"
    And I should not see "Login"
    When  I fill in "First name" with "Mariano S."
    And I fill in "Current password" with "password 1"
    And I press "Update"
    Then I should see "You need to sign in or sign up before continuing."
