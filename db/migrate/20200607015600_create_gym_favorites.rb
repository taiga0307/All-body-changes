class CreateGymFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_favorites do |t|
      t.integer :customer_id
      t.integer :gym_id
      t.timestamps
    end
  end
end
