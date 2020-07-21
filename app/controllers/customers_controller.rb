class CustomersController < ApplicationController

  def fix
    @customer = current_customer
  end

  def fix_update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報の更新が完了しました"
      redirect_to customers_mypage_path
    else
      flash[:alert] = "会員情報の更新が失敗しました"
      render "fix"
    end
  end

  def withdraw
		@customer = current_customer
	end

	def withdraw_update
		@customer = current_customer
		if @customer.update(customer_status: false)
    	#ログアウトさせる
    	reset_session
      flash[:notice] = "退会が完了しました"
    	redirect_to new_customer_registration_path
    else
      flash[:alert] = "退会が失敗しました"
      render "withdraw"
    end
  end

  def customer_params
    params.require(:customer).permit(:name_sei, :name_mei, :yomi_sei, :yomi_mei, :nickname, :postal_code, :prefecture_code, :address_city, :address_street, :tell, :email, :customer_picture_id)
  end
end
