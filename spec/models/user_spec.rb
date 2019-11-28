# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    let(:user) { build(:user) }
    it 'has a valid factory' do
      expect(user).to be_valid
    end

    it 'ensures first name presence' do
      user.first_name = nil
      expect(user.save).to eq(false)
    end

    it 'ensures last name presence' do
      user.last_name = nil
      expect(user.save).to eq(false)
    end

    it 'should save succesfully' do
      expect(user.save).to eq(true)
    end
  end

  describe 'associations user tests' do
    it { is_expected.to have_many(:posts) }
    # it { is_expected.to have_many(:comments) }
    # it { is_expected.to have_many(:likes) }
  end
end
