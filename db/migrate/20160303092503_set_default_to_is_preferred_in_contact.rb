class SetDefaultToIsPreferredInContact < ActiveRecord::Migration
  def change
    change_column :contacts , :is_preferred ,:boolean ,:default => false
  end
end
