# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :user_is_logged_in, only: %i[create update destroy]
  before_action :user_is_confirmed, only: %i[create update destroy]
  before_action :set_comment, only: %i[update destroy]

  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_ident)
      CommentBroadcastJob.perform_later
    else
      redirect_to post_path(@comment.post_ident), notice: 'Cant be blank'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post_ident)
      CommentBroadcastJob.perform_later
    else
      render post_path(@comment.post_ident)
    end
  end

  def destroy
    @comment.destroy
    CommentBroadcastJob.perform_later
    redirect_to post_path(@comment.post_ident)
  end

  def destroy_image
    @comment = Comment.find(params[:comment_id])
    @comment.image.remove!

    redirect_to post_path(@comment.post_ident)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_type,
                                    :commentable_id, :image, :remove_image)
  end
end
