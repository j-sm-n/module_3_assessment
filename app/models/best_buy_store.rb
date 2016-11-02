class BestBuyStore
  attr_reader :long_name,
              :city,
              :distance,
              :phone,
              :type,
              :store_id,
              :address,
              :zip_code,
              :state

  def initialize(store)
    @long_name = store[:longName]
    @city      = store[:city]
    @distance  = store[:distance]
    @phone     = store[:phone]
    @type      = store[:storeType]
    @store_id  = store[:storeId]
    @address   = store[:address]
    @state     = store[:region]
    @zip_code  = store[:postalCode]
    # require 'pry'; binding.pry
  end
end
