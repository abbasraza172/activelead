class ListsController < ApplicationController
  layout 'admin'
  before_action :require_login, except:[:show]

  def index
    @list=List.all
    @user = current_user
    @subscription = @user.subscription
    @plan=@user.plan
    customer = Stripe::Customer.retrieve(current_user.subscription.stripe_customer_id)
    card = Stripe::Customer.retrieve(current_user.subscription.stripe_customer_id)
  end

  def show
    @list = List.find(params[:id])
    render layout: false
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
    params.require(:user).permit(:name, :email, :password,:plan_id,:stripe_token,:list_id , :photo_path,:phone_number,:city,:state,:country, subscription_attributes: [:id, :card_last_four_digits, :card_expiration], user_attributes: [:id, :name, :email, :password, :phone_number, :address, :city, :state, :country], plan_attributes: [:id, :name, :price, :renewal_period])
  end


end
