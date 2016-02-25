# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

ActiveAdmin.register Payment do
  permit_params :total_amount, :charged_amount, :subscription_id, :plan_id

  index do
    selectable_column
    id_column
    column :total_amount
    column :charged_amount
    column :created_at
    actions
  end

  filter :total_amount
  filter :charged_amount
  filter :created_at

  form do |f|
    f.inputs "Payment Details" do
      f.input :subscription_id, collection: Subscription.select([:card_last_four_digits,:id]).map{|s| [s.card_last_four_digits,s.id]}
      f.input :plan_id, collection: Plan.select([:name,:id]).map{|p| [p.name,p.id]}
      f.input :total_amount
      f.input :charged_amount
    end
    f.actions
  end
end
