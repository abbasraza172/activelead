class ListsController < ApplicationController
  layout 'admin'
  before_action :require_login

  def index
    @list=List.all
    @user = current_user
  end

  def update
    respond_to do |format|
      @user = current_user
      if @user.update_attributes(user_params)
        format.html { redirect_to lists_path, notice: 'Associate was successfully updated.' }
        # format.json { render :show, status: :ok, location: @associate }
      else
        format.html { render :index }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def new
    @list= List.new
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,:plan_id,:stripe_token , :photo_path,:phone_number,:city,:state,:country)
  end


end
