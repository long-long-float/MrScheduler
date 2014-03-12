# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require redips-drag-min.js

$(document).ready ->
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
    console.log JSON.stringify(table)
    table2 = []
    table2.push [] for i in [0...table[0].length]
    for col, i in table
      for cell, j in col
        table2[j][i] = cell

    console.log JSON.stringify(table2)