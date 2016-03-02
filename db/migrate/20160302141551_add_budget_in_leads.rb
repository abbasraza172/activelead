class AddBudgetInLeads < ActiveRecord::Migration
  def change
    add_column :leads, :budget, :string
  end
end
