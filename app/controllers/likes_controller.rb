class LikesController < ApplicationController
  before_action :user_is_logged_in,
                only: [:new, :edit, :update, :destroy]
  before_action :set_like,
                only: [:show, :edit, :update, :destroy]
  def create
    @like = current_user.likes.new(like_params)
    @like.save
    # redirect_to post_path(@like.like_ident)
      # if @like.save
    #   redirect_to post_path(@like.like_ident)
    # else
    #   redirect_to post_path(@like.like_ident), notice: 'Cant be blank'
    # end
  end
  def destroy
    @like.destroy
    # redirect_to post_path(@like.like_ident)
  end

  private
  def set_like
    @like = Like.find(params[:id])
  end
  def like_params
    params.require(:like).permit(:likable_type, :likable_id)
  end
end
