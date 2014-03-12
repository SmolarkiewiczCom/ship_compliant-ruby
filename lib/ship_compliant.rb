require 'savon'
require 'active_support/all'

require "ship_compliant/version"
require "ship_compliant/configuration"
require "ship_compliant/client"
require "ship_compliant/base_result"

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

module ShipCompliant
  # Your code goes here...
end
