# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#= require fullcalendar.min.js
#= require jquery.balloon.min.js
#= require textext.core
#= require textext.plugin.focus
#= require textext.plugin.tags

$(document).ready ->
  # For calendar
  tasks_data = $('#tasks-data').text()
  if tasks_data != ''
    tasks = JSON.parse(tasks_data)
    events = tasks.map (task) ->
      {
        id: task.id
        title: task.title
        start: task.deadline
        content: task.content
      }
    current_balloon = null
    $('#calendar').fullCalendar(
      events: events
      eventClick: (event) ->
        current_balloon = event.id
        $(this).attr('id', "event#{event.id}").showBalloon
          contents: """
            <a onclick='$(\"#event#{event.id}\").hideBalloon()' style='cursor: pointer'><i class="fa fa-times"></i></a>
            <p>#{event.title}</p>
            <p>#{event.content}</p>
            """
    ).click ->
      for event in events
        $("#event#{event.id}").hideBalloon() if current_balloon != event.id
      current_balloon = null

  # For timetable
  putSubjects (subject) -> $('<div>').addClass(subject.color).text(subject.name)

  # For tags
  if $('#tags').length
    $('#tags').textext
      plugins: 'focus tags'
      tagsItems: JSON.parse($('#tags-data').text())