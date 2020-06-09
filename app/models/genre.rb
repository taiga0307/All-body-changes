class Genre < ApplicationRecord
  has_many :products
  has_many :gyms
  enum genre_status:{gym:0, product:1} # ジャンル ジム又は商品
end
