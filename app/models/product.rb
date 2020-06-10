class Product < ApplicationRecord
  has_many :product_comments, dependent: :destroy #商品コメントが削除された際に商品コメントテーブルの商品情報も削除
  has_many :product_favorites, dependent: :destroy #商品いいねが削除された際に商品いいねテーブルの商品情報も削除
  belongs_to :genre


  def Product.search(search, genre, direction)
    if direction == "完全一致"
         Product.where(name: "#{search}") #where検索したものを全て取得。find,findby
      elsif direction == "前方一致"
         Product.where(['product_name LIKE ?', "#{search}%"])
      elsif direction == "後方一致"
         Product.where(['product_name LIKE ?', "%#{search}"])
      elsif direction == "部分一致"
         Product.where(['product_name LIKE ?', "%#{search}%"])
      end
  end
end
