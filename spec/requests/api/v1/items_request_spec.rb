require 'rails_helper'

describe "Items CRUD API" do
  it "shows all items" do
    Item.create(name: "Item 1", description: "This is a test", image_url: "www")
    Item.create(name: "Item 2", description: "This is a test test", image_url: "www")
    Item.create(name: "Item 3", description: "This is a test test test", image_url: "www")

    get "http://localhost:3000/api/v1/items"

    expect(response).to be_success
  end
end
