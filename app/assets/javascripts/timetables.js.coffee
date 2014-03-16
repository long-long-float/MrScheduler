# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
#= require textext.core
#= require textext.plugin.focus
#= require textext.plugin.tags

$(document).ready ->
  # For edit
  putSubjects (subject) ->
    console.log subject
    $('<div>')
      .addClass("drag #{subject.color}")
      .css('border-style': 'solid', 'cursor': 'move')
      .text(subject.name)

  enableTimetable()

  $('#timetable-save-btn').click ->
    table = $('#table2>tbody').children().map((i) ->
      return if i == 0
      cells = $(this).children().map((j) ->
        return if j == 0
        $(this).children('div').data('id') ? 0
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
  if $('#subjects').get(0)
    $('#subjects').textext
      plugins: 'focus tags'
      tagsItems: JSON.parse($('#subjects-data').text())