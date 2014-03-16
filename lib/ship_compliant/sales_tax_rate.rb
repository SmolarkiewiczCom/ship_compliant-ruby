module ShipCompliant
  # == ShipCompliant::SalesTaxRate
  #
  # SalesTaxRate is a value object to store sales tax information for freight
  # and products.
  #
  #   tax_rate = SalesTaxRate.new(sales_tax_due: '123.45')
  #   puts tax_rate.sales_tax_due #=> 123.45
  class SalesTaxRate < Struct.new(:sales_tax)

    # Returns the +sales_tax_due+ as a float.
    def sales_tax_due
      sales_tax[:sales_tax_due].to_f
    end

    # Returns the +sales_tax_rate+ as a float.
    def sales_tax_rate
      sales_tax[:sales_tax_rate].to_f
    end

  end
end
