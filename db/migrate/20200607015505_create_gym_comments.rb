class CreateGymComments < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_comments do |t|
      t.string :gym_title
      t.text :gym_comment
      t.float :gym_rate

      t.timestamps
    end
  end
end
