Feature: Check Compliance Of SalesOrder With Address Validation

  Background:
    Given I've added my credentials

  Scenario: Check compliance with missing product
    When I check compliance with a missing product
    Then I should receive a product key error

  Scenario: Check compliance with available product
    When I check compliance with an available product
    Then I should receive the sales tax rates
    And I should receive the shipment compliance results
    And I should receive the suggested address

  Scenario: Check compliance with non-compliant product
    When I check compliance with a non-compliant product
    Then I should receive error messages
