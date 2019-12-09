# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true, uniqueness: { scope: :friend_id }
  validate :friend_cannot_be_user

  def confirm_friendship
    return if confirmed

    update(confirmed: true)
    Friendship.new(user_id: friend_id, friend_id: user_id, confirmed: true).save
  end

  def destroy_friendship
    if confirmed
      Friendship.where('user_id = ? AND friend_id = ?',
                       friend.id, user.id).each(&:destroy)
    end
    destroy
  end

  private

  def friend_cannot_be_user
    errors.add(:invalid_friendship, "can't be friend with same user") if user_id == friend_id
  end
end
