class Customers::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
  	# 入力値のチェック
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id #customersの情報
    # @contact = current_customer.contacts.new(contact_params)=>省略形
    if @contact.valid? #エラーが無い場合trueを返し，エラーが発生した場合falseを返す
    	render 'confirm'
    else
    	render 'new'
    end
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.customer_id = current_customer.id #customersの情報
    if @contact.save # @contactには１つのレコードが保存
    	redirect_to  customers_contacts_thanks_path
    else
    	render 'confirm'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:contact_name, :contact_email, :contact_content, :contact_status)
  end


end
