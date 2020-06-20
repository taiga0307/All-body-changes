class Customers::GenresController < ApplicationController
	def show
		@genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
		@genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

		@products_gyms_all = Product.where(product_valid: true, genre_id: params[:id]) + Gym.where(gym_valid: true, genre_id: params[:id]) # 商品、ジム両方trueの件数・ジャンル絞り・表示カウント
		@genre = Genre.find(params[:id])
		@products = Product.where(genre_id: params[:id]).page(params[:page]).per(3)
		@gyms = Gym.where(genre_id: params[:id]).page(params[:page]).per(3)
	end
end
