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

  Scenario: A non-admin cannot merge two articles
    Given I am logged in as "test"
    And I am on the article page for "Test"
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    And I am on the article page for "Test"
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the article page for "Test"
    Then I should see "More test"
    Then I should see "Welcome to Typo. This is your first article. Edit or delete it, then start blogging!"
