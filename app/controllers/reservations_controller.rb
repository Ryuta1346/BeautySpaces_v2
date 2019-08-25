class ReservationsController < ApplicationController
  before_action :set_current_user, except: [:update]

  def index
  end

  def show
  end

  def edit
  end

  def update
    @reservation = Reservation.find_by(id: params[:id])
    @reservation.update(reservation_params)
    redirect_to admin_salon_url if current_customer.type['Salon']
    redirect_to admin_stylist_url if current_customer.type['Stylist']
  end

  def new
  end

  def create
    @reservation = @user.reservations.build(reservation_params)
    if @reservation.save!
      flash[:success] = "予約しました"
      redirect_to user_url
    else
      flash[:danger] = "予約失敗しました"
      redirect_to user_url
    end
  end

  private

    def set_current_user
      redirect_to root_url unless current_customer&.correct_customer?('User')
      @user ||= current_customer
    end

    def reservation_params
      params.require(:reservation).permit(:salons_reservation_id,
                                          :stylists_reservation_id,
                                          :stylists_menu_id,
                                          :customer_id,
                                          :memo,
                                          :finish_salon,
                                          :finish_stylist,
                                          :salon_memo,
                                          :stylist_memo)
    end
end
