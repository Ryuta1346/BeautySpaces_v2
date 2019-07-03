class Salons::Reservation < ApplicationRecord
  belongs_to :customer

  validates :reservation_time, :operation_time, presence: true
  validates :status, inclusion: { in: [true, false] }
  validates :status, exclusion: { in: [nil] }
end