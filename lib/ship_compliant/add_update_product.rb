module ShipCompliant
  # == ShipCompliant::AddUpdateProduct
  #
  # This method checks to see if a product with the same product key and brand
  # key already exists.
  #
  # If one does not exist, it will add the product with the specified
  # information.
  #
  # If a product exists with the same product key and brand key, but is not
  # referenced by any shipments, the product will be updated with the specified
  # information.
  #
  # If a product exists with the same product key and brand key, and is
  # referenced by one or more shipments, the product will not be updated.
  #
  #   result = ShipCompliant::AddUpdateProduct.product({
  #     # product attributes
  #   }, update_mode: 'IgnoreExisting')
  #
  #   if result.success?
  #     puts "Product added successfully.
  #   else
  #     result.errors.each do |error|
  #       puts error.message
  #     end
  #   end
  class AddUpdateProduct

    # Adds or updates product depending on +:update_mode+.
    #
    # +product+ parameter must be a Hash. The keys must be related to the the
    # keys located in ShipCompliant::ProductAttributes.
    #
    # === Options
    #
    # You can specify the update mode by passing a Hash as the second argument.
    # The default is +ErrorOnExisting+.
    #
    # Available options are.
    #
    # * UpdateExisting - Existing product information is updated.
    # * IgnoreExisting - Pre-existing information is not updated.
    # * ErrorOnExisting - An error message is returned if the product already exists.
    #
    #     ShipCompliant::AddUpdateProduct.product({
    #       # product attributes
    #     }, update_mode: 'UpdateExisting')
    def self.product(product, options: {}, configuration: :default)
      details = {
        'Product' => ProductAttributes.new(product).to_h,
        'UpdateMode' => options.fetch(:update_mode, 'ErrorOnExisting')
      }

      result = add_update_product(details, configuration: configuration)
      AddUpdateProductResult.new(result)
    end

    private

    def self.add_update_product(request, configuration:)
      ShipCompliant.client(configuration: configuration).call(:add_update_product, request)
    end

  end
end
