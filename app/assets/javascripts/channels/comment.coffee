App.comment = App.cable.subscriptions.create "CommentChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#comments[data-parrent_id="' + data.parrent_id + '"]')
      .prepend(data.div)
    $('#comments[data-parrent_id="' + data.parrent_id + '"] .accordion')
      .accordion({
         selector: {
          trigger: '.reply'
        }
      });
    console.log(data.parrent_id)
    console.log($('#comments[data-parrent_id="' + data.parrent_id + '"]'))

