require 'rails_helper'

describe "Best Buy Service" do
  VCR.use_cassette("best_buy_api_service") do
    it "finds all stores by zipcode" do
      
    end
  end
end
