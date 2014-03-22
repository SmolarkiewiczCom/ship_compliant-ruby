Feature: Get Sales Order Extended

  Background:
    Given I've added my credentials

  Scenario: I search for order information
    When I search for order information
    Then I should receive shipment compliance statuses
    And I should receive billing information
    And I should receive shipment information
    And I should receive order channel details

  Scenario: I search for an order that doesn't exist
    When I search for an invalid order
    Then I should receive an error that the order doesn't exist
