class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }

  before_action :load_stats
  before_action :set_current_user

  def load_stats
    @last_30_days = Lead.last_30_days
    @recent_most = Lead.recent_most
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_dashboard_url
    elsif resource.is_a?(User)
      lists_url
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  # def current_user
  #   if cookies.signed[:auth_token].present?
  #     @current_user ||= User.find_by_auth_token(cookies.signed[:auth_token])
  #   else
  #     super
  #   end
  # end

  # def current_user
  #   return unless session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  # end
  def set_current_user
   @current_user =  warden.authenticate(:scope => :user)
  end

end
