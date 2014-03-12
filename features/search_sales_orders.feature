Feature: Search Sales Orders

  Scenario: I search for orders by purchase date
    Given I've added my credentials
    When I search for orders by purchase date
    Then I should find two orders
    And I should receive a success status for search

  Scenario: I have an invalid search
    Given I've added my credentials
    When I search with invalid criteria
    Then I should get an error status for search
