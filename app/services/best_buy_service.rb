class BestBuyService
  attr_reader :stores,
              :total_stores

  def initialize(zip_code)
    response = JSON.parse(get_stores(zip_code).body, symbolize_names: true)
    @total_stores = response[:total]
    @stores = response[:stores]
  end

  def get_stores(zip_code)
    conn.get do |req|
      req.url "v1/stores(area(#{zip_code},25))"
      req.params['format'] = "json"
      req.params['show'] = "storeId,storeType,longName,distance,city,phone"
      req.params['pageSize'] = 15
      req.params['apiKey'] = ENV['BB_API_KEY']
    end
  end

  def conn
    Faraday.new(:url => 'https://api.bestbuy.com/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
