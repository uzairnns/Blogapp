# frozen_string_literal: true

class PostChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'post'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
