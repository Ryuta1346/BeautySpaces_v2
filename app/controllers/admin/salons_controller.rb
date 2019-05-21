class Admin::SalonsController < Admin::BaseController
  before_action :authenticate_salon!

  def show
  end
end
