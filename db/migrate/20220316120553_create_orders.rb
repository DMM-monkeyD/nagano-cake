class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :post_code
      t.string :address
      t.integer :postage
      t.integer :total_price
      t.integer :payment_method, null: false, default: 0
      t.integer :status

      t.timestamps
    end
  end
end
