# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
readURL = (input) ->
  if input.files and input.files[0]
    reader = new FileReader

    reader.onload = (e) ->
      $('.singup-avatar-preview').css 'background-image', 'url(' + e.target.result + ')'
      return

    reader.readAsDataURL input.files[0]
  return

$(document).on 'turbolinks:load', ->
  $('.singup-avatar-input').change ->
    readURL this
    return
  return
