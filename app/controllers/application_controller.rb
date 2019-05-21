class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) do |salon_params|
        salon_params.permit(:category, :prefecture, :name, :place, :tel, :features, :num_of_stylists, :num_of_sheets, :opening_time, :closing_time)
      end

      devise_parameter_sanitizer.permit(:sign_up) do |salon_params|
        salon_params.permit(:category, :prefecture, :name, :place, :tel, :features, :num_of_stylists, :num_of_sheets, :opening_time, :closing_time)
      end

      devise_parameter_sanitizer.permit(:account_update) do |salon_params|
        salon_params.permit(:category, :prefecture, :name, :place, :tel, :features, :num_of_stylists, :num_of_sheets, :opening_time, :closing_time)
      end
    end

    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:category_id, :prefecture_id, :name, :place, :tel, :manage, :num_of_stylists, :num_of_sheets, :cut_price, :features])
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:category_id, :prefecture_id, :name, :place, :tel, :manage, :num_of_stylists, :num_of_sheets, :cut_price, :features])
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:category_id, :prefecture_id, :name, :place, :tel, :manage, :num_of_stylists, :num_of_sheets, :cut_price, :features])
    # end

  def after_sign_in_path_for(resource)
    case resource
    when Salon
      admin_salon_path
    when Stylist
      admin_stylist_path
    # when User
    #   user_path(resource)
    end
  end
end
