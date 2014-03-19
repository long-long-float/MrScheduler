#= require jquery
#= require jquery_ujs
#= require redips-drag-min
#= require sticky
#= require common
#= require jquery.tooltipster.min

$ ->
  $('.side-menu').StickyScroll
    duration: 0

  $notifications = $('<div>')
  for notification in JSON.parse($('#notifications-data').text())[0...10]
    $notifications.append(notification.content).append('<hr>')
  $('#notifications').tooltipster
    trigger: 'click'
    position: 'bottom-left'
    content: $notifications
  $(window).keypress ->
    $('#notifications').tooltipster('hide')