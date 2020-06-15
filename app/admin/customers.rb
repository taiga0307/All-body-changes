ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name_sei, :name_mei, :yomi_sei, :yomi_mei, :nickname, :postal_code, :prefecture_code, :address_city, :address_street, :tell, :password, :customer_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name_sei, :name_mei, :yomi_sei, :yomi_mei, :nickname, :postal_code, :prefecture_code, :address_city, :address_street, :tell, :password, :customer_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  # end
  index do
    selectable_column
    id_column
    column :email
    column :name_sei
    column :name_mei
    column :yomi_sei
    column :yomi_mei
    column :nickname
    column :postal_code
    column :prefecture_code
    column :address_city
    column :address_street
    column :tell
    column :customer_status
    actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :name_sei
      row :name_mei
      row :yomi_sei
      row :yomi_mei
      row :nickname
      row :postal_code
      row :prefecture_code
      row :address_city
      row :address_street
      row :tell
      row :customer_status
    end
  end
end
