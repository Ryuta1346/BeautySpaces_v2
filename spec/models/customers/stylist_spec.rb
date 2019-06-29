require 'rails_helper'

RSpec.describe Stylist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do
    it { is_expected.to validate_length_of :activity_scope }
    it { is_expected.to validate_length_of :features }
  end
end
