class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type])
    end

    def after_sign_in_path_for(resource)
      case resource
      when Salon
        admin_salon_path
      when Stylist
        admin_stylist_path
      when User
        user_path(resource)
      end
    end
end
