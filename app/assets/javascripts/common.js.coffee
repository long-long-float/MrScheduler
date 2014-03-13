@reverse_col_row = (mat) ->
  ret = []
  ret.push [] for i in [0...mat[0].length]
  for row, i in mat
    for cell, j in row
      ret[j][i] = cell
  return ret

@putSubjects = (callback) ->
  data = $('#timetable-data').text()
  return if data == ''
  data = JSON.parse(data)
  $('#table2>tbody').children().each (i) ->
    return if i == 0
    $(this).children().each (j) ->
      return if j == 0

      label = data[i - 1][j - 1]
      return if label == ''
      $(this).html(callback(label))

@enableTimetable = ->
  rd = REDIPS.drag
  rd.init()
  rd.dropMode = 'single'
  rd.hover.colorTd = '#9BB3DA'
  rd.clone.keyDiv = true