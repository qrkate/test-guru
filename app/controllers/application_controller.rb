class ApplicationController < ActionController::Base
  private
  def after_sign_in_path_for(resource)
     if current_user.is_a?(Admin)
       admin_tests_path
     else
       tests_path
     end
  end
end
