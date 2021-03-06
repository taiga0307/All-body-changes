ActiveAdmin.register GymComment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :customer_id, :gym_id, :gym_title, :gym_comment, :gym_rate
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :gym_id, :gym_title, :gym_comment, :gym_rate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
permit_params :gym_title, :gym_comment, :gym_rate

  form do |f|
    f.inputs 'ジム評価' do
      f.input :gym_title
      f.input :gym_comment
      f.input :gym_rate
    end
    f.button "Create"
  end
end
