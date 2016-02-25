class UsersController < ApplicationController

  layout "main"

  before_filter :authenticate_user!, :except => [:new,:create]
  skip_before_action :verify_authenticity_token

  def index

  end

  def show

  end

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user = User.find(@user.id)
      sign_in(:user, user, :bypass => true)
      flash[:notice] = "Signed in successfully"
      redirect_to :root #dashboard
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,:plan_id,:stripe_token)
  end

end
