class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|

      t.integer :user_id
      t.integer :plan_id
      t.integer :status, default: 0
      t.string  :card_last_four_digits
      t.datetime :card_expiration
      t.text :stripe_response
      t.datetime :next_charge_at
      t.string :stripe_customer_id
      t.timestamps null: false
    end
  end
end
