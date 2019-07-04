class Admin::Salons::ReservationsController < ApplicationController
  before_action :set_current_salon

  def index
  end

  def show
  end

  def create
    @reservation = @salon.salon_reservations.create(salon_reservation_params)
    if @reservation.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_salon_url
    else
      flash[:danger] = "登録に失敗しました"
      render admin_salon_path
    end
  end

  def edit
  end

  def update
  end

  def destory
  end

  private

    def set_current_salon
      redirect_to root_url unless current_customer.type["Salon"]
      @salon ||= current_customer
    end

    def salon_reservation_params
      params.require(:salons_reservation).permit(:reservation_time, :operation_time, :memo, :status)
    end
end
