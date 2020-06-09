class CreateReservationManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_managements do |t|

      t.timestamps
    end
  end
end
