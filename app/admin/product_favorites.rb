ActiveAdmin.register ProductFavorite do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :customer_id, :product_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
permit_params :customer_id, :product_id

  form do |f|
    f.inputs '商品お気に入り登録' do
      f.input :customer_id
      f.input :product_id
    end
    f.button "Create"
  end
end
