# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Interface Friendship', type: :feature do
  let(:user) { build(:user) }
  let(:friend) { build(:user) }

  describe 'Interface Friendship' do
    before(:each) do
      user.save
      friend.save
      sign_in friend
      sign_in user
    end

    scenario 'Creating a Friend Request (Add Friend)' do
      visit root_path
      click_link 'New Friends'
      expect(page).to have_content friend.first_name
      expect do
        click_button 'Add Friend'
      end.to change(user.friendships, :count).by(1)
      expect(page).to have_content 'Friend request created.'
      click_link 'My Friends'
      expect(page).to have_content friend.first_name
    end

    let(:friendship) { FactoryBot.build(:friendship, user_id: user.id, friend_id: friend.id) }
    scenario 'Checking Pending friends' do
      friendship.save
      visit friendships_path
      user_friendship = UserFriendship.new(user)
      expect(page).to have_content friend.first_name
      expect(user_friendship.pending_friends.include?(friend)).to eq(true)
    end

    scenario 'Deleting Pending friends' do
      friendship.save
      visit friendships_path
      expect(page).to have_content friend.first_name
      expect do
        click_link 'Delete'
      end.to change(user.friendships, :count).by(-1)
    end

    let(:friendship2) { FactoryBot.build(:friendship, user_id: friend.id, friend_id: user.id) }
    scenario 'Checking people who requested to be friends' do
      friendship2.save
      visit friendships_path
      user_friendship = UserFriendship.new(user)
      expect(page).to have_content friend.first_name
      expect(user_friendship.friend_requests.include?(friend)).to eq(true)
    end

    scenario 'Deleting people who requested to be friends' do
      friendship2.save
      visit friendships_path
      expect(page).to have_content friend.first_name
      expect do
        click_link 'Delete'
      end.to change(friend.friendships, :count).by(-1)
    end

    scenario 'Accepting friendship' do
      friendship2.save
      visit friendships_path
      expect(page).to have_content friend.first_name
      click_button 'Add Friend'
      user_friendship = UserFriendship.new(friend)
      expect(page).to have_content 'Friendship accepted'
      expect(user_friendship.friends.include?(user)).to eq(true)
    end

    scenario 'Deleting Friend' do
      friendship2.save
      visit friendships_path
      expect(page).to have_content friend.first_name
      click_button 'Add Friend'
      expect(page).to have_content 'Friendship accepted'
      expect do
        click_link 'Delete'
      end.to change(friend.friendships, :count).by(-1)
    end

    scenario 'Accepting friendship checking a new row in Friendship table ' do
      friendship2.save
      visit friendships_path
      expect(page).to have_content friend.first_name
      expect do
        click_button 'Add Friend'
      end.to change(Friendship, :count).by(1)
    end

    scenario 'Deleting Friend checking that two rows in Friendship table were deleted' do
      friendship2.save
      visit friendships_path
      expect(page).to have_content friend.first_name
      click_button 'Add Friend'
      expect(page).to have_content 'Friendship accepted'
      expect do
        click_link 'Delete'
      end.to change(Friendship, :count).by(-2)
    end
  end
end
