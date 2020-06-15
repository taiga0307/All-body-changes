ActiveAdmin.register Contact do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :customer_id, :contact_name, :contact_email, :contact_content, :contact_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:customer_id, :contact_name, :contact_email, :contact_content, :contact_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
permit_params :customer_id, :contact_name, :contact_email, :contact_content, :contact_status

  index do
    selectable_column
    id_column
    column :customer_id
    column :contact_name
    column :contact_email
    column :contact_content
    column(:contact_status) do |contact|
      contact.contact_status_i18n
    end
    column :created_at
    actions #閲覧、編集、削除が可能に
  end

  show do
      attributes_table do
        row :id
        row :customer_id
        row :contact_name
        row :contact_email
        row :contact_content
        row(:contact_status) do |contact|
          contact.contact_status_i18n
        end
        row :created_at
      end
  end

end
