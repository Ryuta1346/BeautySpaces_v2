class PrefecturesController < ApplicationController
  def index
  end

  def show
    @pref = Prefecture.find_by(e_name: params[:e_name])
    @areas = @pref.areas
  end
end
