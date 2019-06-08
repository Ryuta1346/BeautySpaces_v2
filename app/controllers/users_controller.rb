class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes!(stylist_params)
      flash[:success] = "情報を変更しました"
      redirect_to user_url
    else
      flash[:danger] = "情報の変更に失敗しました"
      render user_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
