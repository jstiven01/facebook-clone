# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def feed
    Post.where(user: (friends + [self]))
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # Friendship
  def friends
    friendships.map { |friendship| friendship.friend if friendship.confirmed }.compact
  end

  # Users who have yet to confirme friend requests
  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  # Users who have requested to be friends
  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def friend?(user)
    friends.include?(user)
  end

  def reaction_to_post(post_id)
    Reaction.find_by(user_id: id, post_id: post_id)
  end

  # omniauth
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      full_name = auth.info.name.split
      user.first_name = full_name.first
      user.last_name = full_name.last
      user.profile_image = auth.info.image
    end
  end
end
