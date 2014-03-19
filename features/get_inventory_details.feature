Feature: Get Inventory Details

  Scenario: Ask for everything on it
    Given I've added my credentials
    When I get inventory details with everthing
    Then I should be able to get the product information
    And I should inventory levels for a product
