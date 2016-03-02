ActiveAdmin.register List do
  permit_params :name, :desc, :plan_id, list_leads_attributes: [:_destroy,:lead_id,:id], list_users_attributes: [:_destroy, :user_id,:id]

  action_item only: :show do
    link_to('Init TEST', set_test_admin_list_path(list), method: :get) if list.draft?
  end

  member_action :set_test, method: :get do
    list = List.where(id: params[:id]).first
    list.update_attribute(:status,:test)
    redirect_to :back, notice: "Test Initialized"
  end

  action_item only: :show do
    link_to('Confirm', set_confirmed_admin_list_path(list), method: :get) if list.test?
  end

  member_action :set_confirmed, method: :get do
    list = List.where(id: params[:id]).first
    list.update_attribute(:status,:ready)
    redirect_to :back, notice: "List sent to all users. "
  end

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

