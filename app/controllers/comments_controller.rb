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
    # @post = Post.where(id: :post_id)
    #
    # @comment = @post.comment.create(comment_params)
    #
    # if @comment.save
    #   redirect_to post_path(@post)
    # else
    #   redirect_to post_path(@post), {notice: 'error'}
    # end
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      redirect_to post_path(@comment.post), notice: 'some error'
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
    @post = Post.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
