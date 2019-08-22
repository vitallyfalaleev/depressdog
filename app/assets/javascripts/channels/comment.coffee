App.comment = App.cable.subscriptions.create "CommentChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    el = $('#comments[data-parrent_id="' + data.parrent_id + '"][data-parrent_type="' + data.parrent_type + '"]')
    console.log('1111--------')
    console.log(el)
    console.log(data)
#    console.log(data.div)
    if data.parrent_type == "Post"
        el.prepend(data.div)
    else
        el.append(data.div)

    $('#comments[data-parrent_id="' + data.parrent_id + '"] .accordion')
      .accordion({
         selector: {
          trigger: '.reply'
        }
      });
    console.log(data.parrent_id)
    console.log($('#comments[data-parrent_id="' + data.parrent_id + '"]'))

