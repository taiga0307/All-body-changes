class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :customer_id
      t.string :full_name
      t.string :postal_code
      t.string :address
      t.integer :sex, default: 0, null: false
      t.integer :age
      t.string :email
      t.string :tell
      t.datetime :start_date
      t.datetime :end_date
      t.integer :reservation_status, default: 0, null: false

      t.timestamps
    end
  end
end
