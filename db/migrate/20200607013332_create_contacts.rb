class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :customer_id
      t.string :contact_name
      t.string :contact_email
      t.text :contact_content
      t.integer :contact_status, default: 0, null: false
      t.boolean :task_status, default: false, null: false

      t.timestamps
    end
  end
end
