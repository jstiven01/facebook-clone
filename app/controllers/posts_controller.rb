# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.feed
  end

  def create; end

  def edit; end

  def update; end

  def destroy; end
end
