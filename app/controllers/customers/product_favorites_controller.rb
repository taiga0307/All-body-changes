class Customers::ProductFavoritesController < ApplicationController

  before_action :authenticate_customer!# ログインしているユーザーのみ入れる

  def index
    @genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
    @genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

    @customer = current_customer
    @favorite = @customer.product_favorites # current_customerのお気に入りを全件取得
    @products = Product.where(product_valid: true, id: @favorite.pluck(:product_id)).page(params[:page]).per(1)# pluckは特定のカラムの値を限定して取れる
    @products_all = Product.where(product_valid: true, id: @favorite.pluck(:product_id)) # trueの件数＋お気に入りした商品をカウント
  end

	def create
    @product = Product.find(params[:product_id])
    @product_favorite = ProductFavorite.new(product_id: @product.id)
    @product_favorite.customer_id = current_customer.id
    @product_favorite.save
  end

  def destroy
    @product = Product.find(params[:product_id])
    @product_favorite = ProductFavorite.find_by(product_id: @product.id)
    @product_favorite.customer_id = current_customer.id
    @product_favorite.destroy
  end

end
