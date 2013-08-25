Feature: Manage articles
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new article
    Given I am on the new article page
    When I fill in "Description" with "description 1"
    And I fill in "Link" with "link 1"
    And I uncheck "Mark"
    And I fill in "Pubdate" with "pubdate 1"
    And I fill in "Title" with "title 1"
    And I fill in "Guid" with "1"
    And I press "Create"
    Then I should see "description 1"
    And I should see "link 1"
    And I should see "false"
    And I should see "pubdate 1"
    And I should see "title 1"
    And I should see "1"

  Scenario: Delete article
    Given the following articles:
      |description|link|mark|pubdate|title|guid|
      |description 1|link 1|false|pubdate 1|title 1|1|
      |description 2|link 2|true|pubdate 2|title 2|2|
      |description 3|link 3|false|pubdate 3|title 3|3|
      |description 4|link 4|true|pubdate 4|title 4|4|
    When I delete the 3rd article
    Then I should see the following articles:
      |Description|Link|Mark|Pubdate|Title|Guid|
      |description 1|link 1|false|pubdate 1|title 1|1|
      |description 2|link 2|true|pubdate 2|title 2|2|
      |description 4|link 4|true|pubdate 4|title 4|4|
