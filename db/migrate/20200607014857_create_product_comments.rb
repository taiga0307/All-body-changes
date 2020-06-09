class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.string :product_title
      t.text :product_comment
      t.float :product_rate

      t.timestamps
    end
  end
end
