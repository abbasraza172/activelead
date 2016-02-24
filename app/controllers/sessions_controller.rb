class SessionsController < ApplicationController
  layout "application"

  before_filter :logged_in_redirect, :only=>[:new,:create]

  def new
    @user= User.new
  end

  def create
    sfdsfsfsfsdfsdfsd
    @user = User.where(email: params[:user][:email])
    if @user.present? && @user.valid_password?(params[:user][:password])
      if params[:remember_me].present? && params[:remember_me] == "1"
        cookies.permanent.signed[:auth_token] = @user.auth_token
      else
        sign_in @user
      end
      return redirect_to users_path
    else
      flash[:error] = "Email or Password do not match."
    end
    redirect_to :root
  end

  def destroy
    if user_signed_in?
      @user = current_user
      cookies.delete(:auth_token)
      reset_session
      flash[:info] = "You have been successfully signed out"
    end
    redirect_to :root
  end

end
