# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require textext.core
#= require textext.plugin.focus
#= require textext.plugin.tags

$ ->
  # For tags
  if $('#tags').length
    $('#tags').textext
      plugins: 'focus tags'
      tagsItems: JSON.parse($('#tags-data').text())