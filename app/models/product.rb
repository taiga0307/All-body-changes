class Product < ApplicationRecord
  has_many :product_comments, dependent: :destroy #商品コメントが削除された際に商品コメントテーブルの商品情報も削除
  has_many :product_favorites, dependent: :destroy #商品いいねが削除された際に商品いいねテーブルの商品情報も削除
  belongs_to :genre
end
