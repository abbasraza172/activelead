class UsersController < ApplicationController

  layout "main"

  before_filter :require_login, :except => [:new,:create]

  def index

  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      flash[:notice] = "Signed in successfully"
      puts" ** #{current_user.inspect}"
      redirect_to lists_path #dashboard
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password,:plan_id,:stripe_token)
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) do |u|
  #     u.permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  #   end
  # end

end
