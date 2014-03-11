module ShipCompliant
  class SearchSalesOrders

    def self.find_by(query)
      request = OrderSearch.new(query).to_h
      request['Security'] = ShipCompliant.configuration.credentials

      sales = search_sales(request)
      parse_response(sales)
    end

    private
    
    def self.search_sales(request)
      ShipCompliant.client.call(:search_sales_orders, message: {
        'Request' => request
      })
    end

    def self.parse_response(response)
      SearchSalesOrdersResult.new(response.to_hash[:search_sales_orders_response][:search_sales_orders_result])
    end

  end
end
