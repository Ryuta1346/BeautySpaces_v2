class Admin::Salons::ReservationsController < ApplicationController
  before_action :set_current_salon

  def index
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
  end

  def create
    @reservation = @salon.salons_reservations.build(salon_reservation_params)
    if @reservation.save
      flash[:success] = "予約可能時間の登録に成功しました"
      redirect_to admin_salon_url
    else
      flash[:danger] = "予約可能時間の登録に失敗しました"
      redirect_to admin_salon_url
    end
  end

  def edit
  end

  def update
    @reservation = @salon.salons_reservations.build
    if @reservation.update_attributes(salon_reservation_params)
      flash[:success] = "予約可能時間の登録に成功しました"
      redirect_to admin_salon_url
    else
      flash[:danger] = "予約可能時間の登録に失敗しました"
      redirect_to admin_salon_url
    end
  end

  def destroy
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
