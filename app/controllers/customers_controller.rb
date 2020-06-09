class CustomersController < ApplicationController
	def withdraw
		@user = current_customer
	end
	def withdraw_update
		@user = current_customer
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to new_customer_registration_path
    end

end
