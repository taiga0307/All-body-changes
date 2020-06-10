class Gym < ApplicationRecord
  has_many :gym_comments, dependent: :destroy #ジムコメントが削除された際にジムコメントテーブルのジム情報も削除
  has_many :gym_favorites, dependent: :destroy #ジムいいねが削除された際にジムいいねテーブルのジム情報も削除
  has_many :reservation_managements
  belongs_to :genre



  def Gym.search(search, genre, direction)
    if direction == "完全一致"
         Gym.where(name: "#{search}") #where検索したものを全て取得。find,findby
      elsif direction == "前方一致"
         Gym.where(['gym_name LIKE ?', "#{search}%"])
      elsif direction == "後方一致"
         Gym.where(['gym_name LIKE ?', "%#{search}"])
      elsif direction == "部分一致"
         Gym.where(['gym_name LIKE ?', "%#{search}%"])
      end
  end
end
