class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def after_sign_in_path_for(resource)
     if current_user.is_a?(Admin)
       admin_tests_path
     else
       tests_path
     end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
  end
end
