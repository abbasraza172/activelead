class LeadsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  # before_action :set_list

  def index

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
