require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :type }
    it { is_expected.to define_enum_for(:type).with([:User, :Salon, :Stylist]) }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of :name }
    it { is_expected.to validate_presence_of :tel }
    it { is_expected.to validate_length_of :tel }

    # TELが数字のみ、かつ10桁/11桁であることを検証
    it { is_expected.to allow_value('1234567890', '12345678900').for(:tel) }
    it { is_expected.to validate_length_of :city }
    it { is_expected.to validate_presence_of :city }
    it { is_expected.to validate_length_of :address1 }
    it { is_expected.to validate_presence_of :address1 }
  end
end