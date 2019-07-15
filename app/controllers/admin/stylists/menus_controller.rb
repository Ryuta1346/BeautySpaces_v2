class Admin::Stylists::MenusController < ApplicationController
  before_action :set_current_stylist

  def index
    @menu = @stylist.menus.build
    @menus = @stylist.menus.all
  end

  def show
  end

  def create
    @menu = @stylist.menus.build(stylist_menus_params)
    if @menu.save
      flash[:success] = "予約可能時間の登録に成功しました"
      redirect_to admin_stylist_menus_url
    else
      flash[:danger] = "予約可能時間の登録に失敗しました"
      redirect_to admin_stylist_menus_url
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def set_current_stylist
      redirect_to root_url unless current_customer.type['Stylist']
      @stylist ||= current_customer
    end

    def stylist_menus_params
      params.require(:stylists_menu).permit(:name, :price, :sales_copy, :content, :memo, :operation_time)
    end
end
