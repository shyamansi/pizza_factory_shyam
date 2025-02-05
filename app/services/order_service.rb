class OrderService
  def self.create_order(order_params)
    Rails.logger.debug"shyammmmmmm #{order_params.inspect}"
  	order = Order.new(total_price: 0 ,status: "pending")
  	order_params[:items].each do |item|
       if item[:type] == "Pizza"
       	pizza = Pizza.find(item[:id])
       	 raise StandardError, "Pizza not found" if pizza.nil?
       	crust = Crust.find(item[:crust_id])
       	  raise StandardError, "Crust not found" if crust.nil?
       	size_price = case item[:size]
       	             when "Regular" then pizza.price_regular
       	             when "Medium"  then pizza.price_medium
                     when "Large"   then pizza.price_large
                     end
        toppings = Topping.where(id: item[:topping_ids])
        validate_toppings(pizza ,toppings)
        toppings_price = item[:size] == "Large" ? 0 : toppings.sum(&:price)
        extra_cheese_price = item[:extra_cheese] ? 35 : 0
        total_price = size_price + toppings_price + extra_cheese_price
        order.order_items.build(item_type: "Pizza", item_id: pizza.id ,size: item[:size] ,crust_id: item[:crust_id] ,extra_cheese: item[:extra_cheese])
      
        order.total_price += total_price
       elsif item[:type] ="Side"
       	side = Side.find(item[:id])
       	order.order_items.build(item_type: "Side", item_id: side.id)
       	order.total_price += side.price
       end
       end
       if order.save
          # update_inventory(order)
           order
       else
       	 raise StandardError, "Order Failed to Process "
       end
  	end

  	private
  	def self.validate_toppings(pizza , toppings)
  		toppings.each do |topping|
            Rails.logger.debug"shyammmmmmmm22222222 #{topping.category.inspect}========#{pizza.category.inspect}"
         if pizza.category =="Vegetarian"  && topping.category =="Non-Veg"
         	raise StandardError, "Vegetarian Pizza cannot have Non-Veg Topping"
         elsif pizza.category == "Non-Vegetarian"  && topping.name =="Paneer"
         	raise StandardError, "Non-Vegetarian Pizza cannot have Paneer Topping"
  		end
        end
  	end

  	def self.update_inventory(order)
  		# order.order_items.each do |item|
        #       Rails.logger.debug"gopa000000000000 #{item.inspect}"
  		# 	inventory = Inventory.find_by(item_type: item.item_type, item_id: item.item_id)
        #       Rails.logger.debug"gopashyammmmmmm #{inventory.inspect}"
  		# 	inventory.quantity -= 1 if inventory
  		# 	inventory.save
  		# end
       
   	end
  	end
