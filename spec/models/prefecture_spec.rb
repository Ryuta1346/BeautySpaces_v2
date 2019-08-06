require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :e_name }
  end
end
