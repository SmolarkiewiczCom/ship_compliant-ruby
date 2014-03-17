module ShipCompliant
  # == ShipCompliant::CommitSalesOrderResult
  #
  # Wraps the response of +CommitSalesOrder+ and provides methods to quickly
  # access shipments, and the committed shipment keys.
  class CommitSalesOrderResult < Struct.new(:response)
    include BaseResult

    # Returns an array of shipment objects.
    # 
    #   puts result.shipments #=> [
    #     {
    #       key: 'SHIPMENT-KEY',
    #       is_committed: true/false
    #     }
    #   ]
    def shipments
      Array.wrap(response[:shipments][:shipment_commit_response])
    end

    # Gets the keys for committed shipments.
    #
    #   puts result.committed_shipments #=> ['SHIPMENT-1', 'SHIPMENT-2', ...]
    def committed_shipments
      shipments
        .select { |s| s[:is_committed] == true }
        .map { |s| s[:key] }
    end
  end
end
