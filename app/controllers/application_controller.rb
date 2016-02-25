class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_dashboard_path
    elsif resource.is_a?(User)
      users_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def current_user
    if cookies.signed[:auth_token].present?
      @current_user ||= User.find_by_auth_token(cookies.signed[:auth_token])
    else
      super
    end
  end
end
