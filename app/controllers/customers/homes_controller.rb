class Customers::HomesController < ApplicationController

  def top
    @genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
    @genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

    @gyms = Gym.find(GymFavorite.group(:gym_id).order('count(gym_id) desc').limit(4).pluck(:gym_id))
    @products = Product.find(ProductFavorite.group(:product_id).order('count(product_id) desc').limit(4).pluck(:product_id))
    # ProductFavorite.group(:product_id) まず、商品の番号(product_id)が同じものにグループを分ける
    # order('count(product_id) desc' それを、番号の多い順に並び替える
    # limit(3) 表示する最大数を3個に指定する
    # pluck(:product_id)) そして最後に:product_idカラムのみを数字で取り出すように指定。
    # Product.find 最終的に、pluckで取り出される数字を商品のIDとすることでいいね順にproductを取得する事ができる
    # @products = Product.find最後に@productsに代入
  end
end
