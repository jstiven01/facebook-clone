# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user_id, presence: true, uniqueness: { scope: :friend_id }
  validates :friend_id, presence: true

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
end
