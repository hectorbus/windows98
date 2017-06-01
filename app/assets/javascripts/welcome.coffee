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

$updateMmme = ->
  $memeSelector = $('#memeSelector')
  $topText = $('#top-text')
  $bottomText = $('#bottom-text')

  link = 'http://apimeme.com/meme?' + $.param(
    'meme': $memeSelector.val()
    'top': $topText.val()
    'bottom': $bottomText.val())

  $('#meme-image').attr 'src', link
  $('#meme-link').text(link).attr 'href', link
  return

$(document).on 'turbolinks:load', ->
  $('.singup-avatar-input').change ->
    readURL this
    return

  $('#memeForm').change(->
    $updateMmme()
    return
  ).submit ->
    $updateMmme()
    false

  $updateMmme()
  return
