class CreateListLeads < ActiveRecord::Migration
  def change
    create_table :list_leads do |t|
      t.integer :list_id
      t.integer :lead_id

      t.timestamps null: false
    end
  end
end
