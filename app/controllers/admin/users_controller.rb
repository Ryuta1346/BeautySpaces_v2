class Admin::UsersController < Admin::Base
  before_action :set_current_user

  def show
    @reservation  = @user.reservations.new
    @reservations = @user.reservations.includes({ salons_reservation: :customer }, :stylists_reservation, :stylists_menu)
  end

  def edit
  end

  def update
    if @user.update_attributes!(user_params)
      flash[:success] = "情報を変更しました"
      redirect_to user_url
    else
      flash[:danger] = "情報の変更に失敗しました"
      render user_path
    end
  end

  private

    def set_current_user
      redirect_to root_url unless current_customer&.correct_customer?('User')
      @user ||= current_customer
    end

    def user_params
      params.require(:user).permit(:name,
                                   :tel,
                                   :birth_of_year,
                                   :prefecture_id,
                                   :city,
                                   :address1)
    end
end
