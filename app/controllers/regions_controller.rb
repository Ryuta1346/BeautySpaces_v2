class RegionsController < ApplicationController
  def index
  end

  def show
    @region = Region.find_by(e_name: params[:id])
    @prefs = @region.take_place
  end
end
