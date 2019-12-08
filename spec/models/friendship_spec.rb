# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'validation tests' do
    let!(:user_1) { FactoryBot.create(:user) }
    let!(:user_2) { FactoryBot.create(:user) }
    let!(:user_3) { FactoryBot.create(:user) }
    let!(:user_4) { FactoryBot.create(:user) }
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

    let(:friendship1) { FactoryBot.build(:friendship, user_id: user_1.id, friend_id: user_2.id) }
    let(:friendship2) { FactoryBot.build(:friendship, user_id: user_1.id, friend_id: user_2.id) }
    it 'is invalid the same friendship twice' do
      friendship1.save
      expect(friendship2.valid?).to eq(false)
    end

    let(:friendship3) { FactoryBot.build(:friendship, user_id: user_3.id, friend_id: user_4.id) }
    let(:friendship4) { FactoryBot.build(:friendship, user_id: user_4.id, friend_id: user_3.id) }
    it 'is valid the friendships with 2 rows' do
      friendship3.save
      friendship4.save
      expect(friendship4.valid?).to eq(true)
    end

    let(:friendship) { FactoryBot.build(:friendship, user_id: 1, friend_id: 1) }
    it 'is invalid with same user and friend' do
      friendship.valid?
      expect(friendship.errors[:invalid_friendship]).to include("can't be friend with same user")
    end
  end

  describe 'associations post tests' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:friend) }
  end
end
