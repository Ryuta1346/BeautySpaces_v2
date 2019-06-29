class Admin::SalonsController < Admin::Base
  before_action :set_current_salon

  def show
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
      redirect_to root_url unless current_customer.type["Salon"]
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
