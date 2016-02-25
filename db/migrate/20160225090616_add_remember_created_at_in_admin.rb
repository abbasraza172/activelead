class AddRememberCreatedAtInAdmin < ActiveRecord::Migration
  def change
    add_column :admin_users, :remember_created_at, :datetime
  end
end
