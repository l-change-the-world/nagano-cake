class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :member_id, foreign_key: true, null: false, index: true
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :shipping_fee, null: false
      t.integer :payment_method, null: false
      t.integer :status, null: false, default: 0
      t.integer :total_payment_amount, null: false

      t.timestamps
    end
  end
end
