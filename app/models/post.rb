# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content, presence: true
  validates :date_post, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
end
