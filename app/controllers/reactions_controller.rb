# frozen_string_literal: true

class ReactionsController < ApplicationController
  before_action :authenticate_user!
  def create
    @reaction = current_user.reactions.build(reactions_params)
    redirect_to root_path if @reaction.save
  end

  def destroy
    @reaction = Reaction.find(params[:id])
    @reaction.delete
    redirect_to root_path
  end

  private

  def reactions_params
    params.require(:reaction).permit(:post_id)
  end
end
