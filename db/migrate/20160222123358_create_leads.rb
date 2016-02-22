class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :title
      t.text :desc
      t.string :logo
      t.string :lead_type


      t.string :contact_name
      t.string :contact_email
      t.string :contact_number

      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country

      t.string :skype
      t.string :facebook
      t.string :twitter
      t.string :linked_in

      t.string :created_by_type
      t.integer :created_by_id

      t.timestamps null: false
    end
  end
end
