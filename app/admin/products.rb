ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :genre_id, :product_name, :product_description, :product_price, :product_picture_id, :product_brand, :product_valid
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre_id, :product_name, :product_description, :product_price, :product_picture_id, :product_brand, :product_valid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :genre_id, :product_name, :product_description, :product_price, :product_brand, :product_valid, :product_picture_id
  form do |f|
    f.inputs '商品登録' do
      f.input :genre_id,as: :select, collection: Genre.product.map{|genre|[genre.genre_name,genre.id]} #productはモデルに定義
      f.input :product_name
      f.input :product_description
      f.input :product_price
      f.input :product_picture_id, :as => :file
      f.input :product_brand
      f.input :product_valid
    end
    f.button "Create"
  end

  index do
      id_column
      column :genre_id do |product|
        product.genre.genre_name
      end
      column :product_name
      column :product_price
      column :product_brand
      column :product_valid
      column :product_picture_id do |product|
        image_tag(product.product_picture_id.url, size: '150x150')
      end
    actions
  end
  show do
      attributes_table do
        row :id
        row :genre_id do |product|
          product.genre.genre_name
        end
        row :product_name
        row :product_description
        row :product_price
        row :product_brand
        row :product_valid
        row :product_picture_id do # show画面で画像を表示するためのタグを追加
          image_tag(product.product_picture_id.url, size: '400x400')
        end
      end
  end
end
