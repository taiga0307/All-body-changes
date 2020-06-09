class ReservationManagement < ApplicationRecord
  belongs_to :reservation
  belongs_to :gym
end
