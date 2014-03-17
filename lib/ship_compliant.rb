require 'savon'
require 'active_support/all'

require "ship_compliant/version"
require "ship_compliant/configuration"
require "ship_compliant/client"
require "ship_compliant/base_result"
require "ship_compliant/error_result"

# SEARCH SALES ORDERS
require "ship_compliant/order_search"
require "ship_compliant/search_sales_orders"
require "ship_compliant/search_sales_orders_result"
require "ship_compliant/search_sales_order_summary"

# VOID SALES ORDER
require "ship_compliant/void_sales_order"
require "ship_compliant/void_sales_order_result"

# ADD UPDATE PRODUCT
require "ship_compliant/product_attributes"
require "ship_compliant/add_update_product"
require "ship_compliant/add_update_product_result"

# SALES TAX
require "ship_compliant/shipment_sales_tax_rate"
require "ship_compliant/sales_tax_rate"
require "ship_compliant/product_sales_tax_rate"
require "ship_compliant/freight_sales_tax_rate"

# CHECK COMPLIANCE OF SALES ORDER WITH ADDRESS VALIDATION
require "ship_compliant/check_compliance"
require "ship_compliant/check_compliance_result"

require "ship_compliant/shipment_compliance"
require "ship_compliant/compliance_rule"
require "ship_compliant/suggested_address"

require "ship_compliant/commit_sales_order"
require "ship_compliant/commit_sales_order_result"

module ShipCompliant
  # Your code goes here...
end
