Feature: Search Sales Orders

  Scenario: I search for orders by purchase date
    Given I've added my credentials
    When I search for orders by purchase date
    Then I should find two orders
