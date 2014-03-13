Feature: Check Compliance Of SalesOrder With Address Validation

  Scenario: Check compliance with missing product
    Given I've added my credentials
    When I check compliance with a missing product
    Then I should receive a product key error
