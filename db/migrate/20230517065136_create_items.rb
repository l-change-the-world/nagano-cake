class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :genre_id, foreign_key: true, null: false
      t.integer :price_excluding_tax, null: false
      t.boolean :is_for_sale, null: false
      t.timestamps
    end
  end
end
