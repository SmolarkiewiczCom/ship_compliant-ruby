Feature: Search More Sales Orders

  Background:
    Given I've added my credentials

  Scenario: I get second page of orders
    When I search for second page
    Then I should have orders

  Scenario: Invalid paging cookie
    When I search with invalid paging cookie
    Then I should receive an invalid cookie error
