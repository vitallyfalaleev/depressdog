# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :user_is_logged_in,
                only: %i[new edit update destroy]
  def create
    @like = current_user.likes.create(like_params)
    @object = @like.likable
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @object = @like.likable
    @like.destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def like_params
    params.require(:like).permit(:likable_type, :likable_id)
  end
end
