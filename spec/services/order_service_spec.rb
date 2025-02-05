# require 'rails_helper'

# RSpec.describe OrderService do
#   let!(:pizza) { Pizza.create(name: "Deluxe Veggie", category: "Vegetarian", price_regular: 150, price_medium: 200, price_large: 325) }
#   let!(:crust) { Crust.create(name: "New hand tossed") }
#   let!(:topping) { Topping.create(name: "Black olive", category: "veg", price: 20) }
#   let!(:side) { Side.create(name: "Cold drink", price: 55) }
#   let!(:inventory_pizza) { Inventory.create(item_type: "Pizza", item_id: pizza.id, quantity: 5) }
#   let!(:inventory_topping) { Inventory.create(item_type: "Topping", item_id: topping.id, quantity: 10) }
#   let!(:inventory_side) { Inventory.create(item_type: "Side", item_id: side.id, quantity: 10) }

#   it "creates a valid order" do
#     order_params = {
#       items: [
#         { type: "Pizza", id: pizza.id, size: "Large", crust_id: crust.id, extra_cheese: true, topping_ids: [topping.id] },
#         { type: "Side", id: side.id }
#       ]
#     }

#     order = OrderService.create_order(order_params)

#     expect(order).to be_persisted
#     expect(order.order_items.count).to eq(2)
#     expect(order.total_price).to eq(325 + 0 + 35 + 55) # Large pizza + free toppings + extra cheese + side
#   end

#   it "rejects vegetarian pizza with non-veg topping" do
#     non_veg_topping = Topping.create(name: "Chicken tikka", category: "non-veg", price: 35)
#     inventory_non_veg = Inventory.create(item_type: "Topping", item_id: non_veg_topping.id, quantity: 10)

#     order_params = {
#       items: [
#         { type: "Pizza", id: pizza.id, size: "Regular", crust_id: crust.id, extra_cheese: false, topping_ids: [non_veg_topping.id] }
#       ]
#     }

#     expect { OrderService.create_order(order_params) }.to raise_error(StandardError, "Vegetarian pizza cannot have non-veg toppings")
#   end

#   it "updates inventory after order placement" do
#     order_params = {
#       items: [
#         { type: "Pizza", id: pizza.id, size: "Regular", crust_id: crust.id, extra_cheese: false, topping_ids: [topping.id] }
#       ]
#     }

#     OrderService.create_order(order_params)
#     expect(Inventory.find_by(item_type: "Pizza", item_id: pizza.id).quantity).to eq(4)
#     expect(Inventory.find_by(item_type: "Topping", item_id: topping.id).quantity).to eq(9)
#   end
# end
