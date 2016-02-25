ActiveAdmin.register List do
  permit_params :name, :desc, :plan_type

  index do
    selectable_column
    id_column
    column :name
    column :desc
    column :plan_type
    column :created_at
    actions
  end

  filter :name
  filter :plan_type
  filter :created_at

  form do |f|
    f.inputs "List Details" do
      f.input :name
      f.input :desc
      f.input :plan_type
    end
    f.actions
  end
end
