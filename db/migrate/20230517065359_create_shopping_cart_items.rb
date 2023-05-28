class CreateShoppingCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shopping_cart_items do |t|
      t.integer :member_id, foreign_key: true, null: false
      t.integer :item_id, foreign_key: true, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
