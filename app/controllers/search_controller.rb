class SearchController < ApplicationController
  def index
    res = conn.get do |req|
      req.url "v1/stores(area(#{params[:search]},25))"
      req.params['format'] = "json"
      req.params['show'] = "storeId,storeType,longName,distance,city,phone"
      req.params['pageSize'] = 15
      req.params['apiKey'] = ENV['BB_API_KEY']
    end

    raw_stores = JSON.parse(res.body, symbolize_names: true)

    @total_store_count = raw_stores[:total]
    # require 'pry'; binding.pry
    @stores = raw_stores[:stores].map do |store|
      BestBuyStore.new(store)
    end
  end

  def conn
    Faraday.new(:url => 'https://api.bestbuy.com/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end
end
