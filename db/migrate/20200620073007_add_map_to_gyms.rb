class AddMapToGyms < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :latitude, :float
    add_column :gyms, :longitude, :float
  end
end
