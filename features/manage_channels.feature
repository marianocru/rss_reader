Feature: Manage channels
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new channel
    Given a logged in user
    And I follow "New Channel"
    When I fill in "Url" with "http://feeds.reuters.com/reuters/lifestyle"
    And I fill in "Name" with "Reuters: Lifestyle"
    And I press "Create"
    Then I should see "Channel was successfully created"
    And I should see "Name: Reuters: Lifestyle"

  Scenario: Delete channel
    Given the following channels:
     |url|name|user|
     |http://feeds.reuters.com/reuters/lifestyle|Reuters: Lifestyle| email: mariano@hotmail.com |
     |http://feeds.reuters.com/news/artsculture| Reuters: Arts| email: mariano@hotmail.com |
     |http://feeds.reuters.com/reuters/peopleNews| Reuters: People|email: mariano@hotmail.com |
    And a logged in user
    And I am visit the home page
    When I reload the page
    Then I should see "Reuters: Lifestyle"
    And I should see the following channels:
      |id |url|name|
      |2|http://feeds.reuters.com/news/artsculture| Reuters: Arts|
