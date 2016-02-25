ActiveAdmin.register Lead do
  permit_params :title, :desc, :logo, :lead_type, :contact_name, :contact_email, :contact_number,
                :address, :city, :state, :zip, :country, :skype, :linked_in, :facebook, :twitter,
                :created_by_type, :created_by_id

  index do
    selectable_column
    id_column
    column :title
    column :desc
    column :logo
    column :lead_type
    column :contact_name
    column :contact_email
    column :contact_number
    column :address
    column :city
    column :state
    column :zip
    column :country
    column :skype
    column :linked_in
    column :facebook
    column :twitter
    column :created_by_type
    column :created_by_id
    column :created_at
    actions
  end

  filter :title
  filter :lead_type
  filter :created_by_type
  filter :created_by_id
  filter :created_at

  form do |f|
    f.inputs "Lead Details" do
      f.input :title
      f.input :desc
      f.input :logo
      f.input :lead_type
      f.input :contact_name
      f.input :contact_email
      f.input :contact_number
      f.input :address
      f.input :city
      f.input :state
      f.input :zip
      f.input :country
      f.input :skype
      f.input :linked_in
      f.input :facebook
      f.input :twitter
      f.input :created_by_id,as: :hidden, input_html: {value: current_admin_user.id}
    end
    f.actions
  end

end
