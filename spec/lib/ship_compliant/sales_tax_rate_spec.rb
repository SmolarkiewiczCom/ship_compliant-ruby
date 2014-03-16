require "spec_helper"

module ShipCompliant
  describe SalesTaxRate do

    context "sales_tax_due" do
      it "returns sales_tax_due" do
        tax_rate = SalesTaxRate.new(sales_tax_due: '34.43')
        tax_rate.sales_tax_due.should == 34.43
      end
    end

    context "sales_tax_rate" do
      it "return sales_tax_rate" do
        tax_rate = SalesTaxRate.new(sales_tax_rate: '2.34')
        tax_rate.sales_tax_rate.should == 2.34
      end
    end

  end
end
