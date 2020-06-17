class Customers::ProductsController < ApplicationController
	def index
		@products_all = Product.where(product_valid: true) # trueの件数表示のみカウント
		@products = Product.where(product_valid: true).page(params[:page]).per(4) #trueのみ表示＋ページ数指定

		@genres = Genre.all # render(sidebar)用
		@genre_status_products = Genre.where(genre_valid: true, genre_status:1) # ender(sidebar)用/true且つgenre_statusが1の時に
		@genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # ender(sidebar)用/true且つgenre_statusが2の時に

		# @genre = Genre.find(params[:id])
		# @product_genre = Product.where(genre_id: params[:id]).page(params[:page]).per(4)
	end

	def show
 		@product = Product.find(params[:id])
 		# @post_comment = PostComment.new #商品へのコメント

		@genres = Genre.all # render(sidebar)用
		@genre_status_products = Genre.where(genre_valid: true, genre_status:1) # ender(sidebar)用/true且つgenre_statusが1の時に
		@genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # ender(sidebar)用/true且つgenre_statusが2の時に
	end

  private

  def product_params
  	params.require(:product).permit(:genre_id, :product_name, :product_description, :product_price, :product_picture_id, :product_brand, :product_valid)
  end

end
