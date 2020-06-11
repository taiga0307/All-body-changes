class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.integer :genre_id
      t.string :gym_name
      t.text :gym_description
      t.string :gym_tell
      t.string :gym_postal_code
      t.string :gym_address
      t.string :prefecture_code
      t.string :address_city
      t.string :address_street
      t.text :gym_picture_id
      t.string :gym_brand
      t.boolean :gym_valid, default: false, null: false

      t.timestamps
    end
  end
end
