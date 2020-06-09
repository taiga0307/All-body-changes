class Gym < ApplicationRecord
  has_many :gym_comments, dependent: :destroy #ジムコメントが削除された際にジムコメントテーブルのジム情報も削除
  has_many :gym_favorites, dependent: :destroy #ジムいいねが削除された際にジムいいねテーブルのジム情報も削除
  has_many :reservation_managements
  belongs_to :genre
end
