require 'rails_helper'

describe "Zip code search functionality" do
  it "allows user to search for stores near them" do
    # As a user
    # When I visit "/"
    visit root_path
    # And I fill in a search box with "80202" and click "search"
    fill_in "Search", with: "80202"
    click_on "Submit"

    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq("/search")
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    expect(page).to have_content("17 Total Stores")
    # And I should see exactly 15 results
    within('.nearest-stores') do
      expect(page).to have_selector('.store', count: 15)
    end
    # And I should see the long name, city, distance, phone number and store type for each of the 15 results
    within(first('.store')) do
      expect(page).to have_content("Store Name: ")
      expect(page).to have_content("City: ")
      expect(page).to have_content("Distance: ")
      expect(page).to have_content("Phone Number: ")
      expect(page).to have_content("Store Type: ")
    end
  end
end
