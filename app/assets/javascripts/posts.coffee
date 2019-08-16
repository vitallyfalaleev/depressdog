# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



#$(document).on('ajax:success', '.ui.reply.form', (e) =>
#  console.log('ajax success')
#)

$(document).on('click', '.like', (e) =>
  e.preventDefault()
  el = $(e.currentTarget)
  if !el.hasClass('active')
    $.ajax
      type: 'POST',
      url: '/likes',
      dataType: "json",
      data: {
        like: {
          likable_type: el.data('likable-type')
          likable_id: el.data('likable-id')
        }
      },
      success: (response) =>
        $(e.currentTarget)
          .toggleClass('active', response.liked)
          .data('id', response.id)
        $(e.currentTarget).find('.likes-count')
          .text(response.likes_count)
      error: (error) =>
        console.error("Something went wrong")
  else
    $.ajax
      type: 'DELETE'
      url: "/likes/#{el.data('id')}"
      dataType: "json"
      success: (response) =>
        $(e.currentTarget)
          .toggleClass('active', response.liked)
          .data('id', '')
        $(e.currentTarget).find('.likes-count')
          .text(response.likes_count)
      error: (error) =>
        console.error("Something went wrong")
)