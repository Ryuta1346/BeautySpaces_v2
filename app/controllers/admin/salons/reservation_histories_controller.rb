class Admin::Salons::ReservationHistoriesController < Admin::Salons::BaseController

  # 予約済み情報を一覧表示(/reserved_index)
  def index
    salon_reservation_ids = @salon.salons_reservations.pluck(:id)
    @reservations         = Reservation.reserved_schedules(salon_reservation_ids)
  end

  # 個別の予約済み情報取得(/reserved/:id)
  def show
    @reserved_info = Reservation.find(params[:id])
  end

  def edit
  end
end
