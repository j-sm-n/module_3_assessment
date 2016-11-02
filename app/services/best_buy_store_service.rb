class BestBuyStoreService
  attr_reader :hours,
              :store

  def initialize(store_id)
    response = JSON.parse(get_store(store_id).body, symbolize_names: true)
    # require 'pry'; binding.pry
    @store = BestBuyStore.new(response[:stores][0])
    @hours = get_store_hours(store_id)
  end

  def get_store(store_id)
    conn.get do |req|
      req.url "v1/stores(storeId=#{store_id})"
      req.params['format'] = "json"
      req.params['show'] = "storeId,storeType,longName,distance,city,phone,address,region,postalCode"
      req.params['apiKey'] = ENV['BB_API_KEY']
    end
  end

  def conn
    Faraday.new(:url => 'https://api.bestbuy.com/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
