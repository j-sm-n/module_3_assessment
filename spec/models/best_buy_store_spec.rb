require 'rails_helper'

describe "Best Buy Store" do
  it "shows it's specific attributes" do
    store = BestBuyStore.new(longName: "Best Buy South", city: "Denver", distance: "1.3", phone: "3333333333", storeType: "Mobile")

    expect(store.long_name).to eq("Best Buy South")
    expect(store.city).to eq("Denver")
    expect(store.distance).to eq("1.3")
    expect(store.phone).to eq("3333333333")
    expect(store.type).to eq("Mobile")
  end
end
