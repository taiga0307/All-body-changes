class RemoveGenreIdFromProductComments < ActiveRecord::Migration[5.2]

  def up
    remove_column :product_comments, :genre_id
      end

  def down
    add_column :product_comments, :genre_id, :integer
  end
end
