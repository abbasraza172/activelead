ActiveAdmin.register Lead do
  permit_params :title, :desc, :logo, :lead_type, :contact_name, :contact_email, :contact_number,
                :address, :city, :state, :zip, :country, :skype, :linked_in, :facebook, :twitter,:budget,
                :created_by_type, :created_by_id ,contacts_attributes: [:id,:name,:email,:phone, :is_preferred,:title, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column :desc
    column :lead_type
    column :contact_name
    column :contact_email
    column :contact_number
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
      f.input :logo , input_html: {"type"=>"filepicker", "data-fp-apikey" => "AdCCIw6FTLO9F17B7mPc3z", "data-fp-mimetypes" => "image/*", "data-fp-container" => "modal", "onchange" => "loadImage(event.fpfile.url)"},label: 'Input the Logo of your Lead',hint: 'Use this to add images to the rich text below.'
      f.input :lead_type
      f.input :budget
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
      f.has_many :contacts , allow_destroy: true do |ff|
        ff.input :name
        ff.input :email
        ff.input :phone
        ff.input :title
        ff.input :is_preferred
      end
    end
    f.actions
  end

end
