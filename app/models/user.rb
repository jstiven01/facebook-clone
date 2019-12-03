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
         :recoverable, :rememberable, :validatable

  def feed
    Post.where(user_id: self)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def reaction_to_post(post_id)
    Reaction.find_by(user_id: id, post_id: post_id)
  end
end
