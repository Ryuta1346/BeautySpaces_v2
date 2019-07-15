class Admin::StylistsController < Admin::Base
  before_action :set_current_stylist

  def show
    @reservation = @stylist.stylist_reservations.build
    @reservation_index = @stylist.stylist_reservations.all
    @menus = @stylist.menus.all
  end

  def edit
  end

  def update
    if @stylist.update_attributes!(stylist_params)
      flash[:success] = "情報を変更しました"
      redirect_to admin_stylist_url
    else
      flash[:danger] = "情報の変更に失敗しました"
      render edit_admin_stylist_path
    end
  end

  private

    def set_current_stylist
      redirect_to root_url if current_customer.nil? || !current_customer.type['Stylist']
      @stylist ||= current_customer
    end

    def stylist_params
      params.require(:stylist).permit(:category_id,
                                      :prefecture_id,
                                      :name,
                                      :tel,
                                      :address1,
                                      :address2,
                                      :features)
    end
end