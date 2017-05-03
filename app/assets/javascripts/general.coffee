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
    $(this).closest('.window').remove()
    return

  $('.internet-search button').click ->
    url = $(this).closest('.internet-search').find('.url').val()
    $('iframe').attr('src', 'http://web.archive.org/web/19981212034238/http://' + url)
    console.log url
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

  $('.windows-bar-button').click ->
    $('.menu').toggleClass 'hide'
    $('.windows-bar-inset').toggleClass 'active-button'
    return

  $('.windows-app').dblclick ->
    attrName = $(this).attr('windows-app-open')
    switch attrName
      when 'internet'
        $('body').append internetExplorerHtml
      when 'buscaminas'
        $('body').append buscaminasHtml
    windowsMethods()
    console.log attrName
    return

  $('.windows-app-sm').click ->
    attrName = $(this).closest('li').attr('windows-app-sm')
    switch attrName
      when 'internet'
        $('body').append internetExplorerHtml
      when 'buscaminas'
        $('body').append buscaminasHtml
    windowsMethods()
    $('.menu').addClass 'hide'
    $('.windows-bar-inset').removeClass 'active-button'
    console.log attrName
    return

  return

internetExplorerHtml = "<div class='window windows-resizable internet-explorer' style='width:800px'> <div class='header'> <img class='icon' src='/assets/icons/internet-c2f92c7ed7cd9b61234b91d8afa8ae41d9df2a2d079880ab1402c677f08530ab.gif' alt='Internet'> Internet_Explorer.exe <div class='buttons'> <button class='min'>_</button> <button class='max'>☐</button> <button class='bclose'>X</button> </div> </div> <div class='content'> <div class='internet-search'> <input type='text' class='text col-lg-10 url' value='www.yahoo.com'> <button type='button' name='button'>Buscar</button> </div> <iframe src='http://web.archive.org/web/19981212034238/http://www.yahoo.com' class='browser' width='100%' height='100%'></iframe> </div> </div> "

buscaminasHtml = "<div class='window buscaminas-app' style='width:300px'> <div class='header'> <img class='icon' src='/assets/icons/kmines-16fb982fb490f59281e156264a50ea83d265c0e47eb1199fbde56ef916c5f265.gif' alt='Exe'> KMines.exe <div class='buttons'> <button class='min'>_</button> <button class='max'>☐</button> <button class='bclose'>X</button> </div> </div> <div class='content'> <iframe src='http://buscaminas.eu/' width='100%' height='100%' scrolling='no' ></iframe> </div> </div>"
