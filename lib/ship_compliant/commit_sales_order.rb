module ShipCompliant
  class CommitSalesOrder

    def self.call(commit_data)
      commit_data.deep_transform_keys! { |key| key.to_s.camelize }
      result = ShipCompliant.client.call(:commit_sales_order, commit_data)
      CommitSalesOrderResult.new(result)
    end

  end
end
