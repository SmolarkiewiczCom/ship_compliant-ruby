Feature: Void Sales Order

  Scenario: I void an order
    Given I've added my credentials
    When I void an order
    Then I should get a successful response

  Scenario: I void an already voided order
    Given I've added my credentials
    When I void an already void order
    Then I should get an error message
