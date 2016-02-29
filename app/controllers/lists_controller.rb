class ListsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  def index
    @list=List.all
  end


  def new
    @list= List.new
  end


end
