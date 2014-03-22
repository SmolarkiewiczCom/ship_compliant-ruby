Feature: Add Update Brand

  Background:
    Given I've added my credentials

  Scenario: I add a new brand
    When I add a new brand
    Then the brand should have been created

  Scenario: I add a brand that already exists
    When pending

  Scenario: I update a brand that already exists
    When pending

  Scenario: I ignore an existing brand
