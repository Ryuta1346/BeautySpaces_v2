class ApplicationController < ActionController::Base
  devise_group :customer, contains: [:user, :salon, :stylist]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type, :tel, :prefecture_id, :city, :address1, :category_id])
    end

    def after_sign_up_path_for(customer)
      return admin_salon_path if customer.class == Salon
      return admin_stylist_path if customer.class == Stylist
      return user_path if customer.class == User
    end

    def after_sign_in_path_for(customer)
      return admin_salon_path if customer.class == Salon
      return admin_stylist_path if customer.class == Stylist
      return user_path if customer.class == User
    end
end
