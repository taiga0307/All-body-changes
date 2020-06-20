class AddCustomerIdToProductComments < ActiveRecord::Migration[5.2]
  def change
    add_column :product_comments, :customer_id, :integer
  end
end
