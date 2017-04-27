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

windowRandomPos = (element, height, width) ->
  randomH = Math.random() * Math.round(height + $(element).height() * 1.35)
  randomW = Math.random() * Math.round(width + $(element).width() * 1.35)
  $(element).css('top', randomH)
  $(element).css('left', randomW)
  return

$(document).on 'turbolinks:load', ->
  $windowHeight = $('.container').height()
  $windowWidth = $('.container').width()
  $formUserWindow = $('.formUserWindow')

  windowRandomPos($formUserWindow, $windowHeight, $windowHeight)

  $('.singup-avatar-input').change ->
    readURL this
    return

  $('.window').draggable({
    handle: '.header',
    stack: '.window'
  });
  return
