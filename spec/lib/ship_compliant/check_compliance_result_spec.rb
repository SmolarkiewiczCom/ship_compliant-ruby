require "spec_helper"

module ShipCompliant
  describe CheckComplianceResult do
    it_behaves_like "BaseResult"

    subject do
      CheckComplianceResult.new({
        sales_order: {
          is_compliant: true,
          sales_tax_rates: {
            recommended_sales_tax_due: '1372.34',
            shipment_sales_tax_rates: {
              shipment_sales_tax_rate: {
                :@shipment_key => 'SOME-KEY',
                freight_sales_tax_rate: {
                  :@sales_tax_due => 100.5,
                  :@sales_tax_rate => 10.34
                },
                product_sales_tax_rates: {
                  product_sales_tax_rate: {
                    :@brand_key => 'ABC',
                    :@product_key => '123',
                    :@sales_tax_due => 12.332,
                    :@sales_tax_rate => 0.844
                  }
                }
              }
            }
          }
        }
      })
    end

    context "compliant?" do
      it "successed if the salesorder was compliant" do
        subject.compliant?.should be_true
      end

      it "fails if the salesorder was not compliant" do
        result = CheckComplianceResult.new({
          sales_order: { is_compliant: false }
        })

        result.compliant?.should be_false
      end
    end

    context "recommended_tax_due" do
      it "gets the tax due as a float" do
        subject.recommended_tax_due.should == 1372.34
      end
    end

    context "shipment_sales_tax_rates" do
      it "returns an array of sales tax rates" do
        subject.shipment_sales_tax_rates.should == [
          {
            :@shipment_key => 'SOME-KEY',
            freight_sales_tax_rate: {
              :@sales_tax_due => 100.5,
              :@sales_tax_rate => 10.34
            },
            product_sales_tax_rates: {
              product_sales_tax_rate: {
                :@brand_key => 'ABC',
                :@product_key => '123',
                :@sales_tax_due => 12.332,
                :@sales_tax_rate => 0.844
              }
            }
          }
        ]
      end
    end

    context "taxes_for_shipment" do
      it "finds taxes from shipment_key" do
        subject.taxes_for_shipment('SOME-KEY').should == ShipmentSalesTaxRate.new(
          shipment_key = 'SOME-KEY',
          freight = FreightSalesTaxRate.new({ sales_tax_due: 100.5, sales_tax_rate: 10.34 }),
          products = [
            ProductSalesTaxRate.new({ brand_key: 'ABC', product_key: '123', sales_tax_due: 12.332, sales_tax_rate: 0.844 })
          ]
        )
      end
    end
  end
end
