class CommentsController < ApplicationController
  before_action :user_is_logged_in,
                only: [:new, :edit, :update, :destroy]
  before_action :set_comment,
                only: [:show, :edit, :update, :destroy]
  def index
    @comments = Comment.all
  end

  def edit; end

  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_ident)
    else
      redirect_to post_path(@comment.post_ident), notice: 'Cant be blank'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post_ident)
    else
      render post_path(@comment.post_ident)
    end
  end
  def destroy
    @comment.destroy
    redirect_to post_path(@comment.post_ident)
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_type,
                                    :commentable_id, :image)
  end
end
