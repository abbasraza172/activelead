class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.text :desc
      t.string :plan_id

      t.timestamps null: false
    end
  end
end
