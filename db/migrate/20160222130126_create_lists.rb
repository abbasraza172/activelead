class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.text :desc
      t.string :plan_type

      t.timestamps null: false
    end
  end
end
