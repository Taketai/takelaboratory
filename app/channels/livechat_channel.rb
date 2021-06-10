class LivechatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "livechat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
