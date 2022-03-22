class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :tax_price
      t.integer :quantity
      t.integer :making_status

      t.timestamps
    end
  end
end
