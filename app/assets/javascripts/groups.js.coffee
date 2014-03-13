# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require redips-drag-min.js
#= require jquery-ui.custom.min.js
#= require fullcalendar.min.js

reverse_col_row = (mat) ->
  ret = []
  ret.push [] for i in [0...mat[0].length]
  for row, i in mat
    for cell, j in row
      ret[j][i] = cell
  return ret

$(document).ready ->
  $('#calendar').fullCalendar({})

  data = $('#timetable-data').text()
  data = JSON.parse(data)
  $('#table2>tbody').children().each (i) ->
    return if i == 0
    $(this).children().each (j) ->
      return if j == 0

      label = data[i - 1][j - 1]
      return if label == ''
      div = $('<div>')
        .attr('class', "drag #{label[0...2].toLowerCase()}")
        .css('border-style': 'solid', 'cursor': 'move')
        .text(label)
      $(this).html(div)

  rd = REDIPS.drag
  rd.init()
  rd.dropMode = 'single'
  rd.hover.colorTd = '#9BB3DA'
  rd.clone.keyDiv = true

  $('#timetable-save-btn').click ->
    table = $('#table2>tbody').children().map((i) ->
      return if i == 0
      cells = $(this).children().map((j) ->
        return if j == 0
        $(this).text()
        ).get()
      [cells]
      ).get()
    $.ajax(
      url: "/groups/#{$('#group-id').text()}/timetable"
      type: 'PUT'
      data: { data: JSON.stringify(table) }
      )
      .done -> alert '保存が完了しました'