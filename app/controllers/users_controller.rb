class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  layout "application"
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
    @user.skip_confirmation_notification!
    if @user.save
      flash[:notice] = "Signed in successfully"
      redirect_to :users_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
