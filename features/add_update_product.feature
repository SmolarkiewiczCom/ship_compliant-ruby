Feature: Add Update Product

  Background:
    Given I've added my credentials

  Scenario: Add new product with missing Brand
    When I add a new product with invalid brand
    Then I should get an error message for the missing brand

  Scenario: Add new product
    When I add a new product
    Then the product should have been created

  Scenario: Add product that already exists
    When I add a product that already exists
    Then I should get an error for already defined product

  Scenario: Update product that already exists
    When I update a product
    Then I should get a message that the product was updated

  Scenario: Ignore existing product
    When I ignore existing product on update
    Then I should get a message that the product was updated
