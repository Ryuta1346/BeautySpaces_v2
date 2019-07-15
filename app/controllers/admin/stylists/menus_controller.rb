class Admin::Stylists::MenusController < ApplicationController
  before_action :set_current_stylist
  before_action :set_menu, except: [:index]

  def index
    @menu = @stylist.menus.build
    @menus = @stylist.menus.all
  end

  def create
    @menu = @stylist.menus.build(stylist_menus_params)
    if @menu.save
      flash[:success] = "メニューの登録に成功しました"
      redirect_to admin_stylist_menus_url
    else
      flash[:danger] = "メニューの登録に失敗しました"
      redirect_to admin_stylist_menus_url
    end
  end

  def edit
  end

  def update
    if @menu.update_attributes(stylist_menus_params)
      flash[:success] = "#{@menu.name}の編集に成功しました"
      redirect_to admin_stylist_menus_url
    else
      flash[:danger] = "#{@menu.name}の編集に失敗しました"
      render admin_stylist_menus_path
    end
  end

  def destroy
    if @menu.destroy
      flash[:success] = "予約をキャンセルしました"
      redirect_to admin_stylist_menus_url
    end
  end

  private

    def set_current_stylist
      redirect_to root_url unless current_customer.type['Stylist']
      @stylist ||= current_customer
    end

    def set_menu
      @menu = @stylist.menus.find(params[:id])
    end

    def stylist_menus_params
      params.require(:stylists_menu).permit(:name, :price, :sales_copy, :content, :memo, :operation_time)
    end
end
