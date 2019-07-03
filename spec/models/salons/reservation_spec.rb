require 'rails_helper'

RSpec.describe Salons::Reservation, type: :model do
  describe 'validations' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to validate_presence_of :reservation_time }
    it { is_expected.to validate_presence_of :operation_time }
  end
end