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
      redirect_to post_path(@comment.commentable_id)
    else
      redirect_to post_path(@comment.commentable_id), notice: 'some error'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_path(post.id)
    else
      render :edit
    end
  end
  def destroy
    @comment.destroy
    redirect_to post_path(post.id)
  end
  private
  def set_comment
    # @post = Post.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id)
  end
end
