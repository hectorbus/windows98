windowRandomPos = (element, height, width) ->
  randomH = Math.random() * Math.round(height + $(element).height() * 1.35)
  randomW = Math.random() * Math.round(width + $(element).width() * 1.35)
  $(element).css('top', randomH)
  $(element).css('left', randomW)
  return

windowsMethods = ->
  $('.windows-resizable').resizable
    animate: true
    maxHeight: 600
    maxWidth: 1000
    minHeight: 200
    minWidth: 400

  $('.window').draggable
    handle: '.header'
    stack: '.window'
    containment:'document'
    scroll: false

  $('.bclose').click ->
    $(this).parents('.internet-explorer').remove()
    return
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

  $('body').css 'max-height', $(document).height()
           .css 'max-width', $(document).width()

  windowRandomPos($formUserWindow, $windowHeight, $windowHeight)
  windowsMethods()

  $("[windows-app-open='internet-sm']").click ->
    $('.menu').addClass 'hide'
    $('.windows-bar-inset').removeClass 'active-button'
    $('body').append internetExplorerHtml
    windowsMethods()
    return

  $("[windows-app-open='internet']").dblclick ->
    $('body').append internetExplorerHtml
    windowsMethods()
    return

  $('.windows-bar-button').click ->
    $('.menu').toggleClass 'hide'
    $('.windows-bar-inset').toggleClass 'active-button'
    return
  return

internetExplorerHtml = "<div class='window windows-resizable internet-explorer' style='width:800px'> <div class='header'> <img class='icon' src='/assets/icons/internet-c2f92c7ed7cd9b61234b91d8afa8ae41d9df2a2d079880ab1402c677f08530ab.gif' alt='Internet'> Internet Explorer.exe <div class='buttons'> <button class='min'>_</button> <button class='max'>☐</button> <button class='bclose'>X</button> </div> </div> <div class='content'> <div class='internet-search'> <input type='text' class='text col-lg-10 url' value='www.yahoo.com'> <button type='button' name='button'>Buscar</button> </div> <iframe src='http://web.archive.org/web/19981212034238/http://www.yahoo.com' width='100%' height='100%'></iframe> </div> </div> "
