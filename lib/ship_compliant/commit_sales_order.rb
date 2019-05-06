module ShipCompliant
  # == ShipCompliant::CommitSalesOrder
  #
  # This method takes in a Sales Order Key in the request and saves the order
  # if it has previously been checked for compliance.
  #
  # - If the CommitOption is set to “AllShipments”, all the shipments in the sales order will be committed.
  # - If it is set to “CompliantShipments”, just the non-committed compliant sales orders will be committed.
  #
  # Please keep in mind that if “CompliantShipments” is selected, it will be of
  # great value to the customer if the non-compliant, non-committed orders were
  # flagged as such for further review.
  #
  # If the CommitOption is not specified, zero shipments will be committed.
  # This allows the integrator to get the commit status of the shipments in a
  # sales order without committing any of them.
  #
  #   result = ShipCompliant::CommitSalesOrder.call({
  #     commit_option: 'AllShipments',
  #     payments: nil,
  #     sales_tax_collected: 0,
  #     sales_order_key: 'ORDER-KEY'
  #   })
  #
  #   puts result.success? #=> true
  #   puts "The following shipments were committed."
  #
  #   puts result.committed_shipments #=> ['1', '2', ...]
  class CommitSalesOrder

    # Marks a SalesOrder as committed.
    #
    # Returns an instance of ShipCompliant::CommitSalesOrderResult.
    #
    #   ShipCompliant::CommitSalesOrder.call({
    #     commit_options: 'CompliantShipments',
    #     payments: nil,
    #     sales_tax_collected: 0,
    #     sales_order_key: 'ORDER-KEY'
    #   })
    def self.call(commit_data, configuration: :default)
      commit_data.deep_transform_keys! { |key| key.to_s.camelize }
      result = ShipCompliant.client(configuration: configuration).call(:commit_sales_order, commit_data)
      CommitSalesOrderResult.new(result)
    end

  end
end
