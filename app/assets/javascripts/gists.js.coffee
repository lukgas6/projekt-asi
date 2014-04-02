# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_gists_url = $('.pagination .next_page a').attr('href')
      console.log(more_gists_url)
      if more_gists_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
        $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
        $.getScript more_gists_url
      return
    return

$(document).ready ->
  $("#gists").on "click", ".snippet-small", ->
    $(this).siblings(".snippet-full").show()
    $(this).siblings(".snippet").hide()
    $(this).hide()
    $(this).siblings(".snippet-show-full").hide()

