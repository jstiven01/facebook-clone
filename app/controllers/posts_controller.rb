# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @posts = current_user.feed
  end

  def create
    @new_post = current_user.posts.build(posts_params)
    @new_post.date_post = Time.zone.now
    if @new_post.save
      flash[:success] = 'Post created successfully.'
      redirect_to root_path
    else
      flash.now[:danger] = 'Failed to create a new post.'
      render 'index'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def posts_params
    params.require(:post).permit(:content)
  end
end
