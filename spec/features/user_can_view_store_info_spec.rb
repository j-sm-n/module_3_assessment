require 'rails_helper'

describe "Store show page from search" do
  it "shows all information for particular store" do
    # As a user
    # After I have searched a zip code for stores
    visit root_path
    fill_in "Search", with: "80202"
    click_on "Submit"

    expect(current_path).to eq("/search")

    # When I click the name of a store
    click_on "Best Buy Mobile - Cherry Creek Shopping Center"

    # Then my current path should be "/stores/:store_id"
    expect(current_path).to eq("/stores/2740")
    # I should see the store name, store type and address with city, state and zip
    expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(page).to have_content("Mobile")
    expect(page).to have_content("3000 East First Ave, Denver, CO 80206")
    # I should see an unordered list of the store hours in the following format:
    #   * Mon: 10am-9pm
    #   * Tue: 10am-9pm
    #   * Wed: 10am-9pm
    #   * Thurs: 10am-9pm
    #   * Fri: 10am-9pm
    #   * Sat: 10am-9pm
    #   * Sun: 11am-7pm
    expect(page).to have_content("Mon: ")
  end
end
