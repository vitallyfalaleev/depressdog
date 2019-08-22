# frozen_string_literal: true

class CommentChannel < ApplicationCable::Channel
  def subscribed
    # p '0' * 50
    # p params[:id]
    # post = Post.find(params[:id])
    # stream_for post

    stream_from "comment_channel"

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
