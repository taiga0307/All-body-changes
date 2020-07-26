class Gym < ApplicationRecord
  has_many :gym_comments, dependent: :destroy #ジムコメントが削除された際にジムコメントテーブルのジム情報も削除
  has_many :gym_favorites, dependent: :destroy #ジムいいねが削除された際にジムいいねテーブルのジム情報も削除
  has_many :reservations #ジムの予約は多数のため
  belongs_to :genre
  belongs_to :admin_user, optional: true # 外部キーは必ず紐づかないといけないため外部キーがnillでも大丈夫。1対1

  mount_uploader :gym_picture_id, ImageUploader #activeadminにてアップロードするため記述


  def Gym.search(search, genre, direction)
    if direction == "完全一致"
         Gym.where(gym_name: "#{search}") #where検索したものを全て取得。find,findby
      elsif direction == "前方一致"
         Gym.where(['gym_name LIKE ?', "#{search}%"])
      elsif direction == "後方一致"
         Gym.where(['gym_name LIKE ?', "%#{search}"])
      elsif direction == "部分一致"
         Gym.where(['gym_name LIKE ?', "%#{search}%"])
      end
  end

  def price_with_tax(price)
      (price * 1.1).to_i
  end

  def gym_favorited_by?(customer)
      gym_favorites.where(customer_id: customer.id).exists? # 引数で送られたcustomerのidがあるかどうか？ということを判定
  end


end
