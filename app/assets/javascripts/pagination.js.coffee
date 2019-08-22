$(document).on 'turbolinks:load', ->
  if $('#infinite_scroll').size() > 0
    $(window).on 'scroll', ->
      more_posts_url = $('.pagination a:last-child').attr('href')
      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('#posts_home').append('<div class="ui active centered inline loader"></div>')
        $.getScript more_posts_url
      return
      return
      console.log(more_posts_url)