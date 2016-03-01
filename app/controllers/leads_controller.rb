class LeadsController < ApplicationController
  layout 'admin'
  before_action :require_login
  # before_action :set_list

  def index
    @leads = Lead.all

  end

  def show

  end

  def destroy

  end

private

  def set_list
    @list= List.find(params[:list_id])
  end

end
