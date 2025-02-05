require 'rails_helper'

RSpec.describe Order, type: :model do
  it "is valid with a status and total_price" do
    order = Order.new(status: "Pending", total_price: 500)
    expect(order).to be_valid
  end

  it "is invalid without a status" do
    order = Order.new(total_price: 500)
    expect(order).not_to be_valid
  end
end
