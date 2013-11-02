Feature: Write Articles
  As a blog administrator
  In order to share my thoughts with the world
  I want to be able to add articles to my blog

  Background:
    Given the blog is set up
    And the blog has the article "Test" with the body "More test"
    And the blog has the article "Test 2" with the body "Test harder"

  Scenario: Only admins can merge articles
    Given I am on the article page for "Test"
    Then I should not see "Merge Articles"

  Scenario: Successfully merging articles
    Given I am logged into the admin panel
    And I am on the article page for "Test"
    And I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the article page for "Test"
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
