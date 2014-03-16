# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#= require textext.core
#= require textext.plugin.focus
#= require textext.plugin.tags

$(document).ready ->
  # For edit
  putSubjects (label) ->
    $('<div>')
      .attr('class', "drag #{label[0...2].toLowerCase()}")
      .css('border-style': 'solid', 'cursor': 'move')
      .text(label)

  enableTimetable()

  $('#timetable-save-btn').click ->
    table = $('#table2>tbody').children().map((i) ->
      return if i == 0
      cells = $(this).children().map((j) ->
        return if j == 0
        $(this).text()
        ).get()
      [cells]
      ).get()
    group_path = "/groups/#{$('#group-id').text()}"
    $.ajax(
      url: "#{group_path}/timetable"
      type: 'PUT'
      data: { data: JSON.stringify(table) }
      )
      .done -> location.href = group_path

  # For edit_detail
  $('#subjects').textext
    plugins: 'focus tags'
    tagsItems: JSON.parse($('#subjects-data').text())