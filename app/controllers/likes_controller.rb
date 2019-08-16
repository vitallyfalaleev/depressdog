class LikesController < ApplicationController

  before_action :user_is_logged_in, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(like_params)
    @object = @like.likable
    respond_to do |format|
      format.html { redirect_to @object }
      format.json { render json: {liked: true, likes_count: @object.likes.count, id: @like.id} }
      format.js
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @object = @like.likable
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @object }
      format.json { render json: {liked: false, likes_count: @object.likes.count} }
      format.js
    end
  end

  private

  def like_params
    params.require(:like).permit(:likable_type, :likable_id)
  end
end
