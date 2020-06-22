class Customers::GymsController < ApplicationController
	def index
		@genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
		@genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

		@gyms_all = Gym.where(gym_valid: true) # trueの件数表示のみカウント
		@gyms = Gym.where(gym_valid: true).page(params[:page]).per(3) #trueのみ表示＋ページ数指定
	end
	def show
		@genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
		@genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

 		@gym = Gym.find(params[:id])
 		@gym_comment = GymComment.new #施設へのコメントの為
 		@gym_comments = @gym.gym_comments.page(params[:page]).per(2) #コメントのpaginateの為
	end

  private

  def gym_params
  	params.require(:product).permit(:genre_id, :gym_name, :gym_description, :gym_tell, :gym_postal_code, :gym_address, :prefecture_code, :address_city, :address_street, :gym_picture_id, :gym_brand, :gym_valid)
  end
end