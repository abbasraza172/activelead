class ListsController < ApplicationController
  layout 'admin'
  before_action :require_login

  def index
    @list=List.all
  end


  def new
    @list= List.new
  end


end
