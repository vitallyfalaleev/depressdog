# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').first(5)
    @users = User.order('created_at DESC').first(5)
  end
end
