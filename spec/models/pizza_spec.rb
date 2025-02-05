require 'rails_helper'

RSpec.describe Pizza, type: :model do
	it "is valid with a name,category and price" do 
      pizza = Pizza.new(name: "Deluxe Veggie",category:"Vegetarian" , price_regular: 150 , price_medium: 200, price_large: 350)
      expect(pizza).to be_valid      
    end
     
     it "is invalid without a name"  do
     	pizza = Pizza.new(category: "Vegetarian", price_regular: 150)
     	expect(pizza).not_to be_valid
     end

     it "is invalid without a category"  do
     	pizza = Pizza.new(name: "Deluxe Veggie", price_regular: 150)
     	expect(pizza).not_to be_valid
     end
 end