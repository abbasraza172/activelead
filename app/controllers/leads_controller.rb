class LeadsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :set_list

  def index
    @leads = @list.leads.all
    @recent_most = @list.leads.recent_most
  end

  def show

  end

private

  def set_list
    @list= List.find(params[:list_id])
  end

end
