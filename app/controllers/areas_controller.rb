class AreasController < ApplicationController
  def show
    @area = Area.find_by(e_name: params[:e_name])
  end
end
