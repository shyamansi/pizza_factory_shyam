class CreateInventories < ActiveRecord::Migration[7.2]
  def change
    create_table :inventories do |t|
      t.string :item_type  # 'pizza' ,'topping' ,'side'
      t.integer :item_id
      t.integer :quantity

      t.timestamps
    end
  end
end
