class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  # protect_from_forgery with: :null_session

  before_action :load_stats

  def load_stats
    @last_30_days = Lead.last_30_days
    @recent_most = Lead.recent_most.last
  end


  # def after_sign_in_path_for(resource)
  #   if resource.is_a?(AdminUser)
  #     admin_dashboard_url
  #   elsif resource.is_a?(User)
  #     lists_url
  #   end
  # end
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :plan_id,:stripe_token]
  # end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
