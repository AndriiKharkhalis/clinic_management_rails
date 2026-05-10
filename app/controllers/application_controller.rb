class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
  if resource.is_a?(AdminUser)
    admin_dashboard_path
  elsif resource.is_a?(Doctor)
    doctor_profile_path  
  else
    profile_path
  end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :first_name, :last_name, :category_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:phone])
  end
end
