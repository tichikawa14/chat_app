App.room = App.cable.subscriptions.create("RoomChannel", {
  // フロンドとバックエンド側の接続ができたかを判断
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log('connected')
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    alert(data)
  },

  speak: function(content) {
  　// バックエンドのspeakを実行できる
    return this.perform('speak', {message: content});
  }
});
