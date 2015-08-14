module ShipCompliant
  # == ShipCompliant::SearchMoreSalesOrders
  #
  # This method is used in conjunction with SearchSalesOrders to get more
  # results from the search that was performed using SearchSalesOrders. This
  # method will return 100 results each time.
  #
  # Only use this method in conjunction with SearchSalesOrders. When there are
  # more results available from the search, call this method with the token
  # returned from the SearchSalesOrders results or returned from a subsequent
  # call of SearchMoreSalesOrders to see the next page of results.
  #
  #   orders = ShipCompliant::SearchMoreSalesOrders.paging_cookie('paging-cookie')
  #
  #   puts "#{orders.remaining_orders_length} orders left"
  #   
  #   orders.summaries.each do |summary|
  #     puts summary.purchase_date #=> DateTime
  #   end
  class SearchMoreSalesOrders

    # Finds the next 100 orders by a paging cookie. You can get the paging
    # cookie from ShipCompliant::SearchSalesOrders#paging_cookie.
    #
    # Returns an instance of ShipCompliant::SearchSalesOrdersResult.
    #
    #   orders = ShipCompliant::SearchMoreSalesOrders.paging_cookie('paging-cookie')
    #   puts orders.length #=> 100
    def self.paging_cookie(cookie, configuration: :default)
      sales = ShipCompliant.client(configuration: configuration).call(:search_more_sales_orders, {
        'PagingCookie' => cookie
      })

      r = SearchSalesOrdersResult.new(sales)
    end
  end
end

