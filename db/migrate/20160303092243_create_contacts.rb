class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :title
      t.boolean :is_preferred
      t.integer :lead_id

      t.timestamps null: false
    end
  end
end
