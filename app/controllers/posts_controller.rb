class PostsController < ApplicationController
  before_action :user_is_logged_in,
                only: [:new, :edit, :update, :destroy]
  before_action :user_is_confirmed,
                only: [:new, :edit, :update, :destroy]
  before_action :set_post,
                only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.order('created_at DESC')
  end

  # GET /users/:id
  def show
    @images = @post.images.all
  end

  # GET /users/new
  def new
    @post = Post.new
    @image = @post.images.build
  end

  # GET /users/:id/edit
  def edit; end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if params[:data].nil?
        if @post.save
          format.html {redirect_to @post, notice: 'Post created!'}
        else
          format.html {render action: 'new'}
        end
      else
        if @post.save && params[:images]['image'].size <= 5
          params[:images]['image'].each do |i|
            @image = @post.images.create(image: i, post_id: @post.id,
                                         user_id: @post.user_id)
          end
          format.html {redirect_to @post, notice: 'Post created!'}
        else
          format.html {render action: 'new'}
        end
      end
    end
  end

  # PATCH/PUT /posts/:id
  def update
    # render plain: post_params.inspect
    @images = @post.images
    respond_to do |format|
      if params[:data].nil?
        if  @post.update(post_params)
          format.html {redirect_to @post, notice: 'Post updated!'}
        else
          format.html {redirect_to edit_post_path(@post),
                                     notice: 'Someting wrong!'}
        end
      else
        if  @post.update(post_params) && params[:data]['image'].size <= 5 &&
            @post.images.count <=5 && @post.images.count +
            params[:data]['image'].size <= 5
          params[:data]['image'].each do |i|
            @image = @post.images.create(image: i, post_id: @post.id,
                                         user_id: @post.user_id)
          end
          format.html {redirect_to @post, notice: 'Post updated!'}
        else
          format.html {redirect_to edit_post_path(@post),
                                   notice: 'Someting wrong!'}
        end
      end

    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, data:[:post_id, :image])
    end
end
