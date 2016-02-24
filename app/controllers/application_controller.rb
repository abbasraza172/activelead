class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }

  def after_sign_in_path_for(resource)
    users_path
  end

  def logged_in_redirect
    if employee_signed_in?
      redirect_to users_path
    end
  end

end
