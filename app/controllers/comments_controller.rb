# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.build(comments_params)
    @comment.date_comment = Time.zone.now
    if @comment.save
      flash[:success] = 'Comment created successfully.'
    else
      flash.now[:danger] = 'Failed to create a new comment.'
    end
    redirect_to root_path
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.delete
    flash[:success] = 'Comment deleted successfully'
    redirect_to root_path
  end

  private

  def comments_params
    params.require(:comment).permit(:post_id, :content)
  end
end
