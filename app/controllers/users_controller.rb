class UsersController < ApplicationController

  layout "main"

  before_action :require_login, :except => [:new,:create]
  before_action :set_plan, only: [:new,:create]
  def index

  end

  def show

  end

  def new
    @user = User.new
    @user.build_subscription
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      flash[:notice] = "Signed in successfully"
      redirect_to lists_path #dashboard
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,subscription_attributes: [:plan_id,:stripe_token,:id])
  end

  def set_plan
    plan_id = params[:user].present? ? params[:user][:subscription_attributes][:plan_id] : params[:plan_id]
    @plan = plan_id.present? ? Plan.find_by(id: plan_id) : nil
    if @plan.blank?
      redirect_to :root
    end
  end
end
