class Product < ApplicationRecord
  has_many :product_comments, dependent: :destroy #商品コメントが削除された際に商品コメントテーブルの商品情報も削除
  has_many :product_favorites, dependent: :destroy #商品いいねが削除された際に商品いいねテーブルの商品情報も削除  belongs_to :genre
  belongs_to :genre

  validates :product_brand, presence: true, length: { maximum:15 } # 文字数最大15文字
  validates :product_name, presence: true, length: { maximum:30 } # 文字数最大30文字
  validates :product_description, presence: true, length: { maximum:800 } # 文字数最大800文字
  validates :product_picture_id, presence: true
  validates :product_price, presence: true

  mount_uploader :product_picture_id, ImageUploader #activeadminにてアップロードするため記述

  def Product.search(search, genre, direction)
    if direction == "完全一致"
         Product.where(product_valid: true, product_name: "#{search}") #where検索したものを全て取得。
      elsif direction == "前方一致"
         Product.where(['product_name LIKE ?', "#{search}%"]).where(product_valid: true)
      elsif direction == "後方一致"
         Product.where(['product_name LIKE ?', "%#{search}"]).where(product_valid: true)
      elsif direction == "部分一致"
         Product.where(['product_name LIKE ?', "%#{search}%"]).where(product_valid: true)
      end
  end


  def price_with_tax(price)
      (price * 1.1).to_i
  end

  def product_favorited_by?(customer)
      product_favorites.where(customer_id: customer.id).exists? # 引数で送られたcustomerのidがあるかどうか？ということを判定
  end

end
