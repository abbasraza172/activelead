class SessionsController < ApplicationController
  layout 'main'
  def new
    if current_user
      redirect_to lists_path
    end
    @session = User.new
  end

  def create
    @session = User.new(session_params)
    if login(session_params[:email],session_params[:password])
      flash[:success] = 'Welcome back!'
      redirect_to lists_path
    else
      flash.now[:warning] = 'E-mail and/or password is incorrect.'
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = 'See you!'
    redirect_to root_path
  end
  private

  def session_params
    params.require(:session).permit(:email,:password)
  end
end
