class Genre < ApplicationRecord
  has_many :products
  has_many :gyms
  enum genre_status:{gym:0, product:1} # ジャンル ジム又は商品

  scope :product, -> { where(genre_status:1, genre_valid:true) } #activeadminにて商品を指定且つ表示ステータスtrueを指定
  scope :gym, -> { where(genre_status:0, genre_valid:true) } #activeadminにてジムを指定且つ表示ステータスtrueを指定

end
