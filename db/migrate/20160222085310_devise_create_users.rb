class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :crypted_password
      t.string :salt

      ## User Fields
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :zip
      t.string :address
      t.string :city
      t.string :state
      t.string :country

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
