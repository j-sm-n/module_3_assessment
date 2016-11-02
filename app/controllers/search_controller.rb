class SearchController < ApplicationController
  def index
    raw_stores = BestBuyService.new
    @total_store_count = raw_stores[:total]
    # require 'pry'; binding.pry
    @stores = raw_stores[:stores].map do |store|
      BestBuyStore.new(store)
    end
  end
end
