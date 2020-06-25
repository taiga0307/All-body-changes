class AddGymPictureIdToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :customer_picture_id, :text
  end
end
