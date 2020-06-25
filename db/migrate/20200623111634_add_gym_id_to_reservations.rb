class AddGymIdToReservations < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :gym, foreign_key: true
  end
end
