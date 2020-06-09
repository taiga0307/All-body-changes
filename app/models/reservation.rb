class Reservation < ApplicationRecord
  belongs_to :customer
  has_many :reservation_managements
  enum sex: { man: 0, woman: 1} # 性別
  enum reservation_status: { visit: 0, visited: 1} # 見学ステータス
end
