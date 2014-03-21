module ShipCompliant
  class Package < Struct.new(:package)

    def tracking_number
      package[:tracking_number]
    end

    def tracking_status
      package[:tracking_status]
    end

  end
end
