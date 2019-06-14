class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type])
    end

    def after_sign_in_path_for(resource)
      return admin_salon_path if resource.class == Salon
      return admin_stylist_path if resource.class == Stylist
      return user_path(resource) if resource.class == User
    end
end
