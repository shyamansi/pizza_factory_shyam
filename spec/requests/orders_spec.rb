require 'rails_helper'

RSpec.describe "Orders API", type: :request do
  let!(:pizza) { Pizza.create(name: "Deluxe Veggie", category: "Vegetarian", price_regular: 150, price_medium: 200, price_large: 325) }
  let!(:crust) { Crust.create(name: "New hand tossed") }
  let!(:topping) { Topping.create(name: "Black olive", category: "veg", price: 20) }
  let!(:side) { Side.create(name: "Cold drink", price: 55) }
  let!(:inventory_pizza) { Inventory.create(item_type: "Pizza", item_id: pizza.id, quantity: 5) }
  let!(:inventory_topping) { Inventory.create(item_type: "Topping", item_id: topping.id, quantity: 10) }
  let!(:inventory_side) { Inventory.create(item_type: "Side", item_id: side.id, quantity: 10) }

  it "creates a new order successfully" do
    post "/orders", params: {
      order: {
        items: [
          { type: "Pizza", id: pizza.id, size: "Large", crust_id: crust.id, extra_cheese: true, topping_ids: [topping.id] },
          { type: "Side", id: side.id }
        ]
      }
    }.to_json, headers: { "Content-Type": "application/json" }

    expect(response).to have_http_status(:created)
    json = JSON.parse(response.body)
    expect(json["message"]).to eq("Order placed successfully")
  end

  it "returns error for invalid order" do
    post "/orders", params: {
      order: {
        items: [
          { type: "Pizza", id: pizza.id, size: "Large", crust_id: crust.id, extra_cheese: true, topping_ids: [] }
        ]
      }
    }.to_json, headers: { "Content-Type": "application/json" }

    expect(response).to have_http_status(:created)
  end
end
