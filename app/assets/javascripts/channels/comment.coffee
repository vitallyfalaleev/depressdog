$(document).on 'turbolinks:load', ->
  App.comments = App.cable.subscriptions.create ({
    channel: "CommentChannel",
    id: $('#comments[data-parrent_type="Post"]').data('parrent_id')
  }),
   connected: ->
     console.log('log')
   disconnected: ->
   received: (data) ->
    console.log(data.reaction)
    if data.reaction == 'create'
      el = $('[data-parrent_id="' + data.parrent_id + '"][data-parrent_type="' + data.parrent_type + '"]')
      if data.parrent_type == "Post"
        $('#comments[data-parrent_id="' + data.parrent_id + '"][data-parrent_type="' + data.parrent_type + '"]').prepend(data.div)
      else if data.parrent_type == "Comment"
        el.append("<div class='comments'>#{data.div}</div>")
        $('.title.reply').removeClass('active')
        $('[data-parrent_id="' + data.parrent_id + '"][data-parrent_type="' + data.parrent_type + '"] .content.active').removeClass('active')
      $('[data-parrent_id="' + data.parrent_id + '"] .accordion')
        .accordion({
        selector: {
          trigger: '.reply'
        }
      });
      $('.ui.reply.form textarea').val('')
      $('.ui.reply.form input[type="file"]').val('')
    else if data.reaction == 'delete'
      $('[data-parrent_id="' + data.parrent_id + '"][data-parrent_type="Comment"]').remove()
    else if data.reaction == 'update'
      console.log('update')
      console.log(data.image.url)
      $('[data-comment_id="' + data.parrent_id + '"] .content .text .text_body').text(data.comment)
      $('[data-comment_id="' + data.parrent_id + '"] .text .image_body .image').attr("src", data.image.url)
      $('[data-comment_id="' + data.parrent_id + '"] .text.hide').removeClass('hide').addClass('active')
      $('[data-comment_id="' + data.parrent_id + '"] .form.active').removeClass('active').addClass('hide')
    else if data.reaction == 'delete_image'
      $('[data-parrent_id="' + data.parrent_id + '"][data-parrent_type="Comment"] .field.image').html('')
    else
      console.log('else')
