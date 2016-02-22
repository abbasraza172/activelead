class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :total_amount
      t.float :charged_amount
      t.text :stripe_response
      t.integer :subscription_id
      t.integer :plan_id
      t.timestamps null: false
    end
  end
end
