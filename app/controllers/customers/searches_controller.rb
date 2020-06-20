class Customers::SearchesController < ApplicationController

	def search

		@genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
		@genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

		@item_or_club = params[:genre] # application.html.erbで記述した検索フォーム内のgenreが渡される。
    @how_search = params[:direction] # application.html.erbで記述した検索フォーム内のdirectionが渡される。
    if @item_or_club == "item"
      @products = Product.search(params[:search], @item_or_club, @how_search).page(params[:page]).per(1)# モデルにsearchメソッドが定義されており、コントローラーの引数がモデルに渡される。
  	else
  		@gyms = Gym.search(params[:search], @item_or_club, @how_search).page(params[:page]).per(1)
  	end
	end
end
