require 'rails_helper'

describe "Items CRUD API" do
  it "shows all items" do
    Item.create(name: "Item 1", description: "This is a test", image_url: "www")
    Item.create(name: "Item 2", description: "This is a test test", image_url: "www")
    Item.create(name: "Item 3", description: "This is a test test test", image_url: "www")

    get "http://localhost:3000/api/v1/items"

    res = JSON.parse(response.body)

    expect(response).to be_success
    expect(res.count).to eq(3)
  end

  it "shows one item" do
    item = Item.create(name: "Item 1", description: "This is a test", image_url: "www")
           Item.create(name: "Item 2", description: "This is a test test", image_url: "www")
           Item.create(name: "Item 3", description: "This is a test test test", image_url: "www")

    get "http://localhost:3000/api/v1/items/#{item.id}"

    res = JSON.parse(response.body)

    expect(response).to be_success
    expect(res["name"]).to eq("Item 1")
  end

  it "deletes one item" do
    item = Item.create(name: "Item 1", description: "This is a test", image_url: "www")
           Item.create(name: "Item 2", description: "This is a test test", image_url: "www")
           Item.create(name: "Item 3", description: "This is a test test test", image_url: "www")

    delete "http://localhost:3000/api/v1/items/#{item.id}"

    res = JSON.parse(response.body)

    # require 'pry'; binding.pry
    expect(res["status"]).to eq("204")
    expect(res["message"]).to eq("Item #{item.id} was deleted")
  end

  it "posts a new item" do
    params = {name: "Item 1", description: "This is a great item!", image_url: "www"}

    post "http://localhost:3000/api/v1/items", params

    res = JSON.parse(response.body)

    # require 'pry'; binding.pry
    expect(res["status"]).to eq("201")
    expect(res["message"]).to eq("Item 'Item 1' was created!")
    expect(Item.count).to eq(1)
  end
end
