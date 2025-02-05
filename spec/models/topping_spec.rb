require 'rails_helper'

RSpec.describe Topping, type: :model do
  it "is valid with a name, price, and category" do
    topping = Topping.new(name: "Black Olive", price: 20, category: "veg")
    expect(topping).to be_valid
  end

  it "is invalid without a category" do
    topping = Topping.new(name: "Black Olive", price: 20)
    expect(topping).not_to be_valid
  end
end
