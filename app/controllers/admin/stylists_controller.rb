class Admin::StylistsController < Admin::BaseController
  before_action :authenticate_stylist!

  def show
  end
end
