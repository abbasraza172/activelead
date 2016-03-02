ActiveAdmin.register Subscription do
  permit_params :user_id, :plan_id, :status, :card_last_four_digits, :card_expiration, :next_charge_at

  index do
    selectable_column
    id_column
    column :user_id
    column :plan_id
    column :status
    column :card_last_four_digits
    column :card_expiration
    column :next_charge_at
    column :created_at
    actions
  end

  filter :status
  filter :card_expiration
  filter :next_charge_at
  filter :created_at

  form do |f|
    f.inputs "Subscription Details" do
      f.input :user_id,as: :select, collection: User.select([:email,:id]).map{|u| [u.email,u.id]}
      f.input :plan_id,as: :select, collection: Plan.select([:name,:id]).map{|p| [p.name,p.id]}
      f.input :status
      f.input :card_last_four_digits
      f.input :card_expiration
      f.input :next_charge_at
    end
    f.actions
  end

end
