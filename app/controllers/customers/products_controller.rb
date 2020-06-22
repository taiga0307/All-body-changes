class Customers::ProductsController < ApplicationController
	def index
		@genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
		@genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

		@products_all = Product.where(product_valid: true) # trueの件数表示のみカウント
		@products = Product.where(product_valid: true).page(params[:page]).per(4) #trueのみ表示＋ページ数指定
	end

	def show
		@genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
		@genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

 		@product = Product.find(params[:id])
 		@product_comment = ProductComment.new #商品へのコメントの為
 		@product_comments = @product.product_comments.page(params[:page]).per(2) #コメントのpaginateの為
	end

  private

  def product_params
  	params.require(:product).permit(:genre_id, :product_name, :product_description, :product_price, :product_picture_id, :product_brand, :product_valid)
  end

end
