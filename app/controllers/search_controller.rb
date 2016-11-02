class SearchController < ApplicationController
  def index
    raw_stores = BestBuyService.new(params[:search])
    @total_store_count = raw_stores.total_stores
    
    @stores = raw_stores.stores.map do |store|
      BestBuyStore.new(store)
    end
  end
end
