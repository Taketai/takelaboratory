class LivechatsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @livechats = Livechat.all
    @livechat = Livechat.new
  end

  def create
    @livechat = Livechat.new(text: params[:livechat][:text])
    if @livechat.save
      ActionCable.server.broadcast 'livechat_channel', content: @livechat
    end
  end
end
