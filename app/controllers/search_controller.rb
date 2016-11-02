class SearchController < ApplicationController
  def index
    conn = Faraday.new(:url => 'https://api.bestbuy.com/v1') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
