class LeadsController < ApplicationController
  layout 'admin'
  before_action :require_login
  # before_action :set_list

  def index
    @leads = Lead.all
  end


  def new
    @lead= Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      flash[:notice] = "Lead created successfully"
      redirect_to :root
    else
      flash[:errors] = @lead.errors.full_messages
      redirect_to :root
    end
  end

  def show

  end

  def destroy

  end

private

  def set_list
    @list= List.find(params[:list_id])
  end

  def lead_params
    params.require(:lead).permit(:contact_name, :contact_email, :contact_number, :desc, :budget)
  end

end
