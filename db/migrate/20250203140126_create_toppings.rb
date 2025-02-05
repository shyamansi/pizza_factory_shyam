class CreateToppings < ActiveRecord::Migration[7.2]
  def change
    create_table :toppings do |t|
      t.string :name
      t.integer :price
      t.string :category #'veg' or 'non veg'

      t.timestamps
    end
  end
end
