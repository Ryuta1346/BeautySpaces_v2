class Stylists::Reservation < ApplicationRecord
  include Reservable

  validates :activity_scope, presence: true
end