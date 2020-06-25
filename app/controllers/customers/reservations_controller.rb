class Customers::ReservationsController < ApplicationController
  def new
    @gym = Gym.find params[:gym_id]
    @reservation = Reservation.new
  end

  def confirm
    # @contact.customer_id = current_customer.id #customersの情報
    # @contact = Contact.new(contact_params)
    @gym = Gym.find params[:reservation][:gym_id]
    @reservation = current_customer.reservations.new(reservation_params) #=>省略形
    if @reservation.valid? #エラーが無い場合trueを返し，エラーが発生した場合falseを返す
    	render 'confirm'
    else
    	render 'new'
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id #customersの情報
    if @reservation.save # @contactには１つのレコードが保存
    	redirect_to  customers_reservations_thanks_path
    else
    	render 'confirm'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:gym_id, :customer_id, :full_name, :postal_code, :address, :sex, :age, :email, :tell, :start_date, :end_date)
  end
end
