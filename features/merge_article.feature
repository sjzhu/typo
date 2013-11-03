Feature: Merge Articles
  As a blog administrator
  In order organize my thoughts with the world
  I want to be able to merge articles in my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the blog has the article "Test" with the body "More test"
    And the blog has the article "Test 2" with the body "Test harder"
    And I log out

  Scenario: Only admins can merge articles
    Given I am logged in as "test"
    And I am on the article page for "Test"
    Then I should not see "Merge Articles"

  Scenario: Successfully merging articles
    Given I am logged into the admin panel
    And I am on the article page for "Test"
    And I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the article page for "Test"
    Then I should see "More test"
    Then I should see "Test harder"
