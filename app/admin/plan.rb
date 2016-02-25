ActiveAdmin.register Plan do
  permit_params :name, :desc, :price, :renewal_period, :is_active

  index do
    selectable_column
    id_column
    column :name
    column :desc
    column :price
    column :renewal_period
    column :is_active
    column :created_at
    actions
  end

  filter :name
  filter :price
  filter :renewal_period
  filter :is_active
  filter :created_at

  form do |f|
    f.inputs "Plan Details" do
      f.input :name
      f.input :desc
      f.input :price
      f.input :renewal_period
      f.input :is_active
    end
    f.actions
  end

end