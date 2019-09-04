class Admin::Stylists::ReservationsController < ApplicationController
  before_action :set_current_stylist

  def index
  end

  def show
  end

  def create
    @reservation = @stylist.stylists_reservations.build(stylist_reservation_params)
    if @reservation.save
      flash[:success] = "予約可能時間の登録に成功しました"
      redirect_to admin_stylist_url
    else
      flash[:danger] = "予約可能時間の登録に失敗しました"
      redirect_to admin_stylist_url
    end
  end

  def edit
  end

  def update
    @reservation = @stylist.stylists_reservations.find_by(id: params[:id])
    if @reservation.update_attributes(stylist_reservation_params)
      flash[:success] = "予約可能時間の更新に成功しました"
      redirect_to admin_stylist_url
    else
      flash[:danger] = "予約可能時間の更新に失敗しました"
      render admin_stylist_path
    end
  end

  def destroy
    @reservation = @stylist.stylists_reservations.find_by(id: params[:id])
    @reservation.destroy
    flash[:success] = "#{@reservation.reservation_time}の予約可能時間情報を削除しました"
    redirect_to admin_stylist_url
  end

  private

    def set_current_stylist
      redirect_to root_url unless current_customer&.correct_customer?('Stylist')
      @stylist ||= current_customer
    end

    def stylist_reservation_params
      params.require(:stylists_reservation).permit(:reservation_time, :operation_time, :activity_scope, :memo, :status)
    end
end
