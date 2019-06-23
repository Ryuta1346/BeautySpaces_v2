class UsersController < ApplicationController
  before_action :set_user, expect: [:index]

  def index
    @users = User.all
  end

  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name,
                                   :tel,
                                   :birth_of_year,
                                   :prefecture_id,
                                   :address1,
                                   :address2
      )
    end
end
