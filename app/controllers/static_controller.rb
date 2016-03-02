class StaticController < ApplicationController

  layout "main"

  def index
    @lead= Lead.new
  end

end