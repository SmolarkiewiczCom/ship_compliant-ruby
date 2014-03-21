Feature: Get Sales Order Extended

  Scenario: I search for order information
    Given I've added my credentials
    When I search for order information
    Then I should receive shipment compliance statuses
    And I should receive billing information
    And I should receive shipment information
    And I should receive order channel details

  Scenario: I search for an order that doesn't exist
    When pending
