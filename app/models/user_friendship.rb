# frozen_string_literal: true

class UserFriendship
  def initialize(user)
    @user_fr = user
  end

  # Friendship
  def feed
    Post.where(user: (friends + [@user_fr]))
  end

  def friends
    @user_fr.friendships.map { |friendship| friendship.friend if friendship.confirmed }.compact
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    @user_fr.friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    @user_fr.inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def friend?(user)
    friends.include?(user)
  end
end
