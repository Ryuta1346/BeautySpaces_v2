class Admin::Salons::BaseController < ApplicationController
  before_action :set_current_salon

  private

    def set_current_salon
      redirect_to root_url unless current_customer&.correct_customer?('Salon')
      @salon ||= current_customer
    end

    def salon_reservation_params
      params.require(:salons_reservation).permit(:reservation_time, :operation_time, :memo, :status)
    end
end
