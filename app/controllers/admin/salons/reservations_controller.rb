class Admin::Salons::ReservationsController < ApplicationController
  before_action :set_current_salon

  # 予約されていない情報を一覧表示
  def index
    salon_reservation_ids    = @salon.salons_reservations.pluck(:id)
    reservations             = Reservation.in_salon_reservations(salon_reservation_ids).pluck(:salons_reservation_id)
    @unreserved_reservations = @salon.salons_reservations.where.not(id: reservations)
  end

  # 予約済み情報を一覧表示
  def reserved_index
    salon_reservation_ids = @salon.salons_reservations.pluck(:id)
    @reservations         = Reservation.reserved_schedules(salon_reservation_ids)
  end

  def reserved
    @reserved_info        = Reservation.find(params[:id])
  end

  def show
    @reservation = @salon.salons_reservations.find(params[:id])
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
    @reservation = @salon.salons_reservations.find_by(id: params[:id])
    if @reservation.update_attributes(salon_reservation_params)
      flash[:success] = "予約可能時間の更新に成功しました"
      redirect_to admin_salon_url
    else
      flash[:danger] = "予約可能時間の更新に失敗しました"
      render admin_salon_path
    end
  end

  def destroy
    @reservation = @salon.salons_reservations.find_by(id: params[:id])
    @reservation.destroy
    flash[:success] = "#{@reservation.reservation_time}の予約可能時間情報を削除しました"
    redirect_to admin_salon_url
  end

  private

    def set_current_salon
      redirect_to root_url unless current_customer&.correct_customer?('Salon')
      @salon ||= current_customer
    end

    def salon_reservation_params
      params.require(:salons_reservation).permit(:reservation_time, :operation_time, :memo, :status)
    end
end
