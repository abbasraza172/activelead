class ChangePlanTypeToPlanIdInLists < ActiveRecord::Migration
  def change
    remove_column :lists, :plan_type, :string
    add_column :lists, :plan_id, :integer
  end
end
