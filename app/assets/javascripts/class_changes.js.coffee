# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  timetable = JSON.parse($('#timetable-data').text())

  getDayBySelects = (id) ->
    vals = (parseInt($("#class_change_date#{id}_#{index}i").val()) for index in [1..3])
    vals.unshift null
    vals[2]--;
    date = new (Date.bind.apply(Date, vals))
    console.log [vals, date]
    date.getDay()

  createUpdateSubject = (id) ->
    ->
      index = parseInt($("#class_change_index#{id}").val())
      $("#subject#{id}").text timetable[index - 1]?[getDayBySelects(id) - 1]?.name ? '該当なし'

  for id in [1, 2]
    for index in [1..3]
      $("#class_change_date#{id}_#{index}i").change createUpdateSubject(id)
    $("#class_change_index#{id}")
      .change createUpdateSubject(id)
      .keyup createUpdateSubject(id)