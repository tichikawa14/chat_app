class RoomChannel < ApplicationCable::Channel
  # フロンドとバックエンドを監視する
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # this.perform('speak');から処理が実行する
  def speak(data)
    #room.jsから送られてきたデータを受信
    message =  Message.create!(content: data["message"])
    template = ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
    #room.jsのRoomChannelにデータを送信
    ActionCable.server.broadcast 'room_channel', template
  end
end
