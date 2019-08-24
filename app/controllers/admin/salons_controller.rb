class Admin::SalonsController < Admin::Base
  before_action :set_current_salon

  def show
    @reservation       = @salon.salons_reservations.build
    @reservation_index = @salon.salons_reservations.all
    @salon_reserve     = Salons::Reservation.where(customer: @salon).pluck(:id)
    @rev_today         = Reservation.include_reserve_info(@salon_reserve).specify_datetime
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
