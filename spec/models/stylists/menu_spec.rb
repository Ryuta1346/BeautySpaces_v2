require 'rails_helper'

RSpec.describe Stylists::Menu, type: :model do
  describe 'validations' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :operation_time }
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :memo }

    it { is_expected.to validate_length_of(:sales_copy).is_at_most(100) }
  end
end
