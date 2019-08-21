# frozen_string_literal: true

class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comment_#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
