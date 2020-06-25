ActiveAdmin.register Reservation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :customer_id, :full_name, :postal_code, :address, :sex, :age, :email, :tell, :start_date, :end_date, :reservation_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :full_name, :postal_code, :address, :sex, :age, :email, :tell, :start_date, :end_date, :reservation_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
      id_column
      column :customer_id
      column :gym_id
      column :full_name
      column :postal_code
      column :address
      column :sex
      column :age
      column :email
      column :tell
      column :start_date
      column :reservation_status
    actions
  end
end
