require 'rails_helper'

RSpec.describe Stylist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of :name }
    it { is_expected.to validate_length_of :activity_scope }
    it { is_expected.to validate_length_of :features }
    it { is_expected.to validate_length_of :address1 }
    it { is_expected.to validate_length_of :address2 }
  end
end
