Feature: Add Update Brand

  Background:
    Given I've added my credentials

  Scenario: I add a new brand
    When I add a new brand
    Then the brand should have been created

  Scenario: I add a brand that already exists
    When I add a brand that already exists
    Then I should get an error for already defined brand

  Scenario: I update a brand that already exists
    When I update an existing brand
    Then the brand should have been updated

  Scenario: I ignore an existing brand
    When I ignore existing brand on update
    Then the brand should have been updated
