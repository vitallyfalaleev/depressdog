# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    # @posts = Post.order('created_at DESC').first(5)
    @posts = Post
                 .paginate(page: params[:page], per_page: 10)
                 .order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
    end
    @users = User.order('created_at DESC').first(5)
  end
end
