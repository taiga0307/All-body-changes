ActiveAdmin.register ProductComment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :product_id, :product_title, :product_comment, :product_rate, :customer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:product_id, :product_title, :product_comment, :product_rate, :customer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
permit_params :product_title, :product_comment, :product_rate

  form do |f|
    f.inputs '商品評価' do
      f.input :product_title
      f.input :product_comment
      f.input :product_rate
    end
    f.button "Create"
  end
end
