class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.integer :lead_id
      t.integer :attachable_id
      t.string :attachable_type
      t.string :file

      t.timestamps null: false
    end
  end
end
