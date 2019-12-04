# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context 'validation tests' do
    let!(:user_1) { FactoryBot.create(:user) }
    let!(:user_2) { FactoryBot.create(:user) }
    let(:valid_friendship) { FactoryBot.create(:friendship) }
    let(:friendship) { FactoryBot.build(:friendship, user_id: nil, friend_id: nil) }

    it 'is invalid without a user' do
      friendship.valid?
      expect(friendship.errors[:user]).to include('must exist')
    end

    it 'is invalid without a friend' do
      friendship.valid?
      expect(friendship.errors[:friend]).to include('must exist')
    end
  end

  describe 'associations post tests' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:friend) }
    # it { is_expected.to have_many(:comments) }
    # it { is_expected.to have_many(:likes) }
  end
end
