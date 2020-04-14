# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    # Do not show the current user
    @users = @users.reject { |user| user == current_user }
    #  Do not show the actual  current_user's friends
    @users = @users.reject { |user| UserFriendship.new(current_user).friends.include?(user) }
    # Do not show the pending friends
    @users = @users.reject { |user| UserFriendship.new(current_user).pending_friends.include?(user) }
    # Do not show the friends _request
    @users = @users.reject { |user| UserFriendship.new(current_user).friend_requests.include?(user) }
    @friendship = Friendship.new
  end

  def show
    @user = User.find(params[:id])
    @user_friendship = UserFriendship.new(@user)
    @posts = @user.posts
  end
end
