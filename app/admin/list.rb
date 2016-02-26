ActiveAdmin.register List do
  permit_params :name, :desc, :plan_id, list_leads_attributes: [:_destroy,:lead_id,:id], list_users_attributes: [:_destroy, :user_id,:id]

  index do
    selectable_column
    id_column
    column :name
    column :desc
    column :plan_id
    column :created_at
    actions
  end

  filter :name
  filter :plan_id
  filter :created_at

  form do |f|
    f.inputs "List Details" do
      f.input :name
      f.input :desc
      f.input :plan
    end

    f.inputs "List Leads" do
      f.has_many :list_leads do |ll|
        ll.input :lead_id ,as: :select, collection: Lead.all
        ll.input :_destroy, as: :boolean, label: 'Delete this lead from list ?'
      end
    end


    # f.inputs "List Users" do
    #   f.has_many :list_users do |lu|
    #     lu.input :user_id,as: :select, collection: User.select([:email,:id]).map{|s| [s.email,s.id]}
    #     # lu.input :_destroy, as: :boolean, label: 'Delete this user from list ?'
    #   end
    # end
    f.actions
  end

end

