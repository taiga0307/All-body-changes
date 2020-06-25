class Customers::ContactsController < ApplicationController

  before_action :authenticate_customer!# ログインしているユーザーのみ入れる
  def index
    @contact = current_customer.contacts #has_many :contactでcustomerとアソシエーションされているため情報を呼び出せる。
  end

  def new
    @contact = Contact.new
  end

  def confirm
    # @contact.customer_id = current_customer.id #customersの情報
    # @contact = Contact.new(contact_params)
    @contact = current_customer.contacts.new(contact_params) #=>省略形
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
    params.require(:contact).permit(:contact_name, :contact_email, :contact_content, :contact_status, :task_status)
  end


end
