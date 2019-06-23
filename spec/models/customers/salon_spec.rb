require 'rails_helper'

RSpec.describe Salon, type: :model do
  describe 'association' do
    it {should belong_to(:category).class_name('Category')}
    it {should belong_to(:prefecture).class_name('Prefecture')}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :category }
    it { is_expected.to validate_presence_of :prefecture }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_length_of :name }
    it { is_expected.to validate_presence_of :tel }
    it { is_expected.to validate_uniqueness_of :tel }
    it { is_expected.to validate_length_of :tel }
    it { is_expected.to validate_numericality_of :tel }
    it { is_expected.to validate_presence_of :num_of_sheets }
    it { is_expected.to validate_length_of :num_of_sheets }
    it { is_expected.to validate_presence_of :features }
    it { is_expected.to validate_length_of :features }
    it { is_expected.to validate_presence_of :opening_time }
    it { is_expected.to validate_numericality_of :opening_time }
    it { is_expected.to validate_presence_of :closing_time }
    it { is_expected.to validate_numericality_of :closing_time }
    it { is_expected.to validate_presence_of :address1 }
    it { is_expected.to validate_presence_of :address2 }
  end
end
