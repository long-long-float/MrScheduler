#= require jquery
#= require jquery_ujs
#= require redips-drag-min
#= require sticky
#= require common
#= require jquery.tooltipster.min

$ ->
  $('.side-menu').StickyScroll
    duration: 0
  $.get '/notify_all'
  $notifications = $('<div>').addClass('nt')
  for notification in JSON.parse($('#notifications-data').text())[0...10]
    $notifications.append($('<a>').addClass(unless notification.is_read then 'highlight'  else 'none').attr('href','#').text(notification.content)).append('<br>')
  $notifications.append($('<a>').attr('href','/user/notifications').text('全部読む'))
  $('#notifications').click ->
    #ajax code
    $.get '/read_all'
    $('#notifications').removeClass('cn').text('0')
  .tooltipster
    trigger: 'click'
    position: 'bottom-left'
    content: $notifications
  $(window).keypress ->
    $('#notifications').tooltipster('hide')