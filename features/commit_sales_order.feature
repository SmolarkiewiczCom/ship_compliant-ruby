Feature: Commit Sales Order

  Scenario: I commit a sale with all shipments
    Given I've added my credentials
    When I commit a sale with all shipments
    Then I get a successful commit message
