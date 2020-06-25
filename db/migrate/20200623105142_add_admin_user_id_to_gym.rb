class AddAdminUserIdToGym < ActiveRecord::Migration[5.2]
  def change
    add_reference :gyms, :admin_user, foreign_key: true
  end
end
