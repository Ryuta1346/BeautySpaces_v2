class RegionsController < ApplicationController
  def index
  end

  def show
    @region = Region.find_by(e_name: params[:e_name])
    @prefs = @region.areas
  end
end
