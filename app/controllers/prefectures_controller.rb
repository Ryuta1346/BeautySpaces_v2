class PrefecturesController < ApplicationController
  def index
  end

  def show
    @pref = Prefecture.find_by(e_name: params[:id])
    @areas = @pref.take_place
  end
end
