class SearchController < ApplicationController
  def index
    raw_stores = BestBuyService.new(params[:search])
    @total_store_count = raw_stores.total_stores

    @stores = raw_stores.stores.map do |store|
      BestBuyStore.new(store)
    end
  end

  def show
    raw_store = BestBuyStoreService.new(params[:store_id])

    @store_info = raw_store.store_info
    @store_hours = raw_store.hours
  end
end
