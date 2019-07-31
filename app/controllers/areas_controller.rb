class AreasController < ApplicationController
  def show
    @area = Area.find_by(e_name: params[:id])
  end
end
