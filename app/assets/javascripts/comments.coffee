# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $(document).on 'click', '.reply.edit', ->
    id = $(this).data('comment_id')
    if($('[data-parrent_id="' + id + '"] .text').hasClass('active') == true)
      $('[data-parrent_id="' + id + '"] .text.active').removeClass('active').addClass('hide')
    else
      $('[data-parrent_id="' + id + '"] .text.hide').removeClass('hide').addClass('active')

    if($('[data-parrent_id="' + id + '"] .form').hasClass('hide') == true)
      $('[data-parrent_id="' + id + '"] .form.hide').removeClass('hide').addClass('active')
    else
      $('[data-parrent_id="' + id + '"] .form.active').removeClass('active').addClass('hide')
