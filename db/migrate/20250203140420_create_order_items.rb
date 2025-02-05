class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.string :item_type # 'pizza' or 'side'
      t.integer :item_id
      t.string :size      #regular ,medium ,large
      t.integer :crust_id
      t.boolean :extra_cheese

      t.timestamps
    end
  end
end
