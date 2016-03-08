class FirstNameLastNameToNameInUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    User.update_all("name = (first_name || ' ' || last_name)")
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
