# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require fullcalendar.min.js
#= require jquery.balloon.min.js

$(document).ready ->
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

  putSubjects (label) -> label