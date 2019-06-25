require 'rails_helper'

RSpec.describe Salon, type: :model do
  # describe 'association' do
  #   it {should belong_to(:category).class_name('Category')}
  #   it {should belong_to(:prefecture).class_name('Prefecture')}
  # end

  describe 'validations' do
    it { is_expected.to validate_length_of :num_of_sheets }
    it { is_expected.to validate_length_of :features }
  end
end