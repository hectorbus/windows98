windowRandomPos = (element, height, width) ->
  randomH = Math.random() * Math.round(height + $(element).height() * 1.35)
  randomW = Math.random() * Math.round(width + $(element).width() * 1.35)
  $(element).css('top', randomH)
  $(element).css('left', randomW)
  return

$(document).on 'turbolinks:load', ->
  $('#current_timer').countdowntimer
    currentTime: true
    size: 'xs'
    borderColor : "#bfbfbf"
    backgroundColor : "#bfbfbf"
    fontColor : "#070707"

  $windowHeight = $('.container').height()
  $windowWidth = $('.container').width()
  $formUserWindow = $('.formUserWindow')

  windowRandomPos($formUserWindow, $windowHeight, $windowHeight)

  $('.windows-bar-button').click ->
    $('.menu').toggleClass 'hide'
    $('.windows-bar-inset').toggleClass 'active-button'
    return
  return
