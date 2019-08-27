class Admin::SalonsController < Admin::Base
  before_action :set_current_salon

  def show
    salon_reserve      = @salon.salons_reservations.where(customer: @salon).pluck(:id)
    @rev_today         = Reservation.includes(:salons_reservation, :stylists_menu, :customer, stylists_reservation: [:customer])
                             .joins_reserve_info(salon_reserve)
                             .specify_datetime
                             .order(reservation_time: :asc)
  end

  def edit
  end

  def update
    if @salon.update_attributes!(salon_params)
      flash[:success] = "情報を変更しました"
      redirect_to admin_salon_url
    else
      flash[:danger] = "情報の変更に失敗しました"
      render edit_admin_salon_path
    end
  end

  private

    def set_current_salon
      redirect_to root_url unless current_customer&.correct_customer?('Salon')
      @salon ||= current_customer
    end

    def salon_params
      params.require(:salon).permit(:category_id,
                                    :prefecture_id,
                                    :name,
                                    :tel,
                                    :features,
                                    :num_of_sheets,
                                    :opening_time,
                                    :closing_time)
    end
end