# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @posts = current_user.feed
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.build(posts_params)
    @post.date_post = Time.zone.now
    if @post.save
      flash[:success] = 'Post created successfully.'
      redirect_to root_path
    else
      flash.now[:danger] = 'Failed to create a new post.'
      render 'index'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(content: posts_params[:content], date_post: Time.zone.now)
      flash[:success] = 'Post was successfully updated.'
      redirect_to current_user
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    flash[:success] = 'Post deleted successfully'
    redirect_to current_user
  end

  private

  def posts_params
    params.require(:post).permit(:content)
  end
end
