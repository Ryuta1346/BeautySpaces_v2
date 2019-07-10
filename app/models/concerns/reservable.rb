module Reservable
  extend ActiveSupport::Concern
  included do
    belongs_to :customer

    validates :reservation_time, :operation_time, presence: true
    validates :status, inclusion: { in: [true, false] }
    validates :status, exclusion: { in: [nil] }

    default_scope -> { order(reservation_time: :asc) }
  end
end