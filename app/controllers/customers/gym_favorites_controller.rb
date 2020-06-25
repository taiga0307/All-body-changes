class Customers::GymFavoritesController < ApplicationController

	before_action :authenticate_customer!# ログインしているユーザーのみ入れる

  def index
    @genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
    @genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

    @customer = current_customer
    @favorite = @customer.gym_favorites # current_customerのお気に入りを全件取得
    @gyms = Gym.where(gym_valid: true, id: @favorite.pluck(:gym_id)).page(params[:page]).per(1)# 特定のカラムの値を限定して取れる
    @gyms_all = Gym.where(gym_valid: true, id: @favorite.pluck(:gym_id)) # trueの件数＋お気に入りした施設をカウント
  end

	def create
    @gym = Gym.find(params[:gym_id])
    @gym_favorite = GymFavorite.new(gym_id: @gym.id)
    @gym_favorite.customer_id = current_customer.id
    @gym_favorite.save
  end

  def destroy
    @gym = Gym.find(params[:gym_id])
    @gym_favorite = GymFavorite.find_by(gym_id: @gym.id)
    @gym_favorite.customer_id = current_customer.id
    @gym_favorite.destroy

  end
end
