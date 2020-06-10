class CustomersController < ApplicationController

  def fix
    @customer = current_customer
  end

  def fix_update
    @customer = current_customer
     @customer.update(customer_params)
        redirect_to new_customer_registration_path
  end

  def withdraw
		@customer = current_customer
	end

	def withdraw_update
		@customer = current_customer
		@customer.update(customer_status: false)
        	#ログアウトさせる
        	reset_session
        	redirect_to new_customer_registration_path
  end

  def search
    	@products = Product.all
    	@gyms = Gym.all

    	@product_or_gym = params[:genre]
    	# application.html.erbで記述した検索フォーム内のgenreが渡される。
    	@how_search = params[:direction]
    	# application.html.erbで記述した検索フォーム内のdirectionが渡される。
    	if @product_or_gym == "product"
      		@products = Product.search(params[:search], @product_or_gym, @how_search)# モデルにsearchメソッドが定義されており、コントローラーの引数がモデルに渡される。
    	else
      		@gyms = Gym.search(params[:search], @product_or_gym, @how_search)
    	end
  end

  def customer_params
    params.require(:customer).permit(:name_sei, :name_mei, :yomi_sei, :yomi_mei, :nickname, :postal_code, :prefecture_code, :address_city, :address_street, :tell, :email )
    end
end
