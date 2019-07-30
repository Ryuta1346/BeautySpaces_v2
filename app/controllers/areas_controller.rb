class AreasController < ApplicationController
  def show
    @area = Area.find_by(category_name: params[:id])
  end
end
