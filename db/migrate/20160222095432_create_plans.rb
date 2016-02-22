class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :desc
      t.string :stripe_id
      t.float :price
      t.integer :renewal_period
      t.boolean :is_active, default: false

      t.timestamps null: false
    end
  end
end
