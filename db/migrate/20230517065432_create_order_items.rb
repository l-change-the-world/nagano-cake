class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :order_id, foreign_key: true, null: false, index: true
      t.integer :item_id, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.integer :price, null: false
      t.integer :production_status, default: 0, null: false
      t.timestamps
    end
  end
end
