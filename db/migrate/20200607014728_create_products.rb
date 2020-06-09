class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_description
      t.integer :product_price
      t.text :product_picture_id
      t.string :product_brand
      t.boolean :product_valid, default: false, null: false

      t.timestamps
    end
  end
end
