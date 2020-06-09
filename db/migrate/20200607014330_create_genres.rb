class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :genre_name
      t.integer :genre_status, default: 0, null: false
      t.boolean :genre_valid, default: false, null: false

      t.timestamps
    end
  end
end
