#pizza
Pizza.create(name:"Deluxe Veggie",category:"Vegetarian",price_regular: 150,price_medium: 190 ,price_large: 250)
Pizza.create(name:"Non-Veg Supreme",category:"Non-Vegetarian",price_regular: 190,price_medium: 250 ,price_large: 350)

#crust
Crust.create(name: "New hand tossed")
Crust.create(name: "Wheat thin crust")

#toppings
Topping.create(name: "Black Olive" ,category:"Veg" ,price: 20)
Topping.create(name:"Chicken Tikka" ,category:"Non-Veg",price: 50)

 #sides

 Side.create(name: "Cold Drink" ,price: 50)
 Side.create(name: "Balck Cake", price: 90)

 #Inventory

 Inventory.create(item_type: "Pizza" , item_id: 1 ,quantity: 10)
 Inventory.create(item_type: "Topping" , item_id: 1, quantity:20)