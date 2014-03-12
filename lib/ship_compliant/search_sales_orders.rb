module ShipCompliant
  # == ShipCompliant::SearchSalesOrders
  #
  # Search orders in the ShipCompliant database on a number of different
  # criteria such as date ranges, order number range, order list, status, etc...
  #
  # Summary details, including tracking numbers, of Sales Orders and
  # Shipments are returned for the first 100 orders that meet the search criteria.
  #
  # Use this method to get tracking numbers for a collection of orders,
  # check shipping status, check compliance status, or check fulfillment status.
  #
  # Results are paged, and only the first 100 results are returned with this method.
  # Use the ShipCompliant::SearchSalesOrdersResult#remaining_orders_length method in
  # conjunction with this method to page through the result set.
  #
  # _You must specify at least one of the date range options or an invoice number range in this request._
  #
  #   orders = ShipCompliant::SearchSalesOrders.find_by({
  #     purchase_date_min: DateTime.new(2014, 3, 10),
  #     purchase_date_max: DateTime.new(2014, 3, 12)
  #   })
  class SearchSalesOrders

    # +query+ must be a Hash with the keys relating to each search criteria.
    #
    # To see a list of available keys take a look at OrderSearch::KEYS
    # 
    #   # find orders place within date
    #   orders = ShipCompliant::SearchSalesOrders.find_by({
    #     purchase_date_min: DateTime.new(2014, 3, 10),
    #     purchase_date_max: DateTime.new(2014, 3, 12)
    #   })
    #
    #   # find orders by compliance_status
    #   orders = ShipCompliant::SearchSalesOrders.find_by({
    #     compliance_status: 'NotCompliant' # possible values are "Compliant", "NotCompliant", or "Any". Any is default.
    #   })
    def self.find_by(query)
      order_query = OrderSearch.new(query).to_h

      sales = search_sales(order_query)
      parse_response(sales)
    end

    private
    
    def self.search_sales(order_query)
      ShipCompliant.client.call(:search_sales_orders, order_query)
    end

    def self.parse_response(response)
      SearchSalesOrdersResult.new(response.to_hash[:search_sales_orders_response][:search_sales_orders_result])
    end

  end
end
