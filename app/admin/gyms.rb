ActiveAdmin.register Gym do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :genre_id, :gym_name, :gym_description, :gym_tell, :gym_postal_code, :gym_address, :prefecture_code, :address_city, :address_street, :gym_picture_id, :gym_brand, :gym_valid
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre_id, :gym_name, :gym_description, :gym_tell, :gym_postal_code, :gym_address, :prefecture_code, :address_city, :address_street, :gym_picture_id, :gym_brand, :gym_valid]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :genre_id, :gym_name, :gym_description, :gym_tell, :gym_postal_code, :prefecture_code, :address_city, :address_street, :gym_picture_id, :gym_brand, :gym_valid, :latitude, :longitude
  form do |f|
    f.inputs '施設登録' do
      f.input :genre_id,as: :select, collection: Genre.club.map{|genre|[genre.genre_name,genre.id]} #clubはgenreモデルに定義
      f.input :gym_name
      f.input :gym_description
      f.input :gym_tell
      f.input :gym_postal_code
      f.input :prefecture_code
      f.input :address_city
      f.input :address_street
      f.input :gym_picture_id, :as => :file
      f.input :gym_brand
      f.input :gym_valid
    end
    f.button "Create"
  end

  index do
      id_column
      column :genre_id do |gym|
        gym.genre.genre_name
      end
      column :gym_name
      column :gym_tell
      column :gym_postal_code
      column :prefecture_code
      column :address_city
      column :address_street
      column :gym_brand
      column :gym_valid
      column :gym_picture_id do |gym|
        image_tag(gym.gym_picture_id.url, size: '150x150')
      end
    actions
  end

  show do
      attributes_table do
        row :id
        row :genre_id do |gym|
          gym.genre.genre_name
        end
        row :gym_name
        row :gym_description
        row :gym_tell
        row :gym_postal_code
        row :prefecture_code
        row :address_city
        row :address_street
        row :gym_picture_id, :as => :file
        row :gym_brand
        row :gym_valid
        row :gym_picture_id do # show画面で画像を表示するためのタグを追加
          image_tag(gym.gym_picture_id.url, size: '400x400')
        end
      end
  end

  controller do
    def create
      gym = Gym.new(permitted_params[:gym])
      geoinfo = Geocoder.coordinates(permitted_params[:gym][:prefecture_code]+ permitted_params[:gym][:address_city] + permitted_params[:gym][:address_street])
      gym.latitude = geoinfo[0]
      gym.longitude = geoinfo[1]
      if gym.save
        redirect_to admin_gym_path(gym)
      else
        redirect_to request.referrer
      end
    end

    def update
      gym = Gym.find(params[:id])
      geoinfo = Geocoder.coordinates(permitted_params[:gym][:prefecture_code]+ permitted_params[:gym][:address_city] + permitted_params[:gym][:address_street])
      gym.latitude = geoinfo[0]
      gym.longitude = geoinfo[1]
      if gym.update(permitted_params[:gym])
        redirect_to admin_gym_path(gym)
      else
        redirect_to request.referrer
      end
    end
  end



end
