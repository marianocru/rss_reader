Feature: Manage channels
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Background: login a user
    Given a logged in user

  Scenario: Register new channel
    Given I am in the home page
    And I follow "New Channel"
    When I fill in "Url" with "http://feeds.reuters.com/reuters/lifestyle"
    And I fill in "Name" with "Reuters: Lifestyle"
    And I press "Create"
    Then I should see "Channel was successfully created"
    And I should see "Name: Reuters: Lifestyle"

  @javascript
  Scenario: select channel
    Given I am visit the home page
    When I select the channel id 1002
    Then I should see "arts"
    And I should not see "life 1"
    And I should see "art 1"

  @javascript
  Scenario: Find article
    Given I am visit the home page
    And  I fill in "tittle" with "1"
    When I press "Search"
    Then I should see "life 1"
    And I should see "art 1"
    And I should not see "money"

  @javascript
  Scenario: Show comments
    Given I am visit the home page
    When I select the channel id 1002
    And I press 'View Comments' in the article id 1004
    Then I should see "comment 1"
    And I should see "comment 2"
    And I should not see "comment 3"

  @javascript
  Scenario: Add comments
    Given I am visit the home page
    When I select the channel id 1002
    And I press 'Add Comment' in the article id 1004
    And  I should see "Comment"
    And I fill in "Comment" with "This is my comment"
    And I press "Create Comment"
    Then I should see "This is my comment"
    And I should see "This is my comment"

   @javascript
  Scenario: View favorite articles
    Given I am visit the home page
    When I press "Show Favorites"
    Then I should see "life 1"
    And I should see "art 1"
    And I should not see "life 2"
    And I should not see "life 3"

  @javascript
  Scenario: Delete channel
    Given I am visit the home page
    When I delete the channel id 1001
    And I reload the page
    Then I should not see "life"
    And I should see "arts"
    And I should not see "money"