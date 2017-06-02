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

paintMethods = ->
  $('.paint-canvas').jqScribble
    brushSize: 4

  $('.color-picker').click ->
    color = $(this).css("background-color")
    $('.paint-canvas').data('jqScribble').update
      brushColor: color
    return

  $('.brush-size').click ->
    size = $(this).attr("b-size")
    $('.paint-canvas').data('jqScribble').update
      brushSize: size
    return

  $('.eraser').click ->
    $('.paint-canvas').data('jqScribble').update
      brushColor: '#ffffff'
    return

  $('.cross').click ->
    $('.paint-canvas').data('jqScribble').clear()
    return
  return

openAppMethods = ->
  $('.windows-app').dblclick ->
    attrName = $(this).attr('windows-app-open')
    switch attrName
      when 'internet'
        $('body').append internetExplorerHtml
      when 'buscaminas'
        $('body').append buscaminasHtml
      when 'paint'
        $('body').append paintHtml
        paintMethods()
      when 'meme'
        ajaxCallmeme '.win98', '/apps/meme'
    windowsMethods()
    return

  $('.windows-app-sm').click ->
    attrName = $(this).closest('li').attr('windows-app-sm')
    switch attrName
      when 'internet'
        $('body').append internetExplorerHtml
      when 'buscaminas'
        $('body').append buscaminasHtml
      when 'paint'
        $('body').append paintHtml
        paintMethods()
      when 'fx'
        ajaxCallfx '.win98', '/apps/fx'
        fxMethods()
      when 'meme'
        ajaxCallmeme '.win98', '/apps/meme'
    windowsMethods()
    $('.menu').addClass 'hide'
    $('.windows-bar-inset').removeClass 'active-button'
    return
  return

ajaxCallfx = (selector, route) ->
  $.ajax(url: route).done (html) ->
    $(selector).append html
    openAppMethods()
    otherWindowsMethods()
    windowsMethods()
    fxMethods()
  return

ajaxCallmeme = (selector, route) ->
  $.ajax(url: route).done (html) ->
    $(selector).append html
    openAppMethods()
    otherWindowsMethods()
    windowsMethods()
  return

fxMethods = ->
  $('button.fx-submit').click ->
    sumX = 0; sumXSRoot = 0; sumY = 0; sumXY = 0; a = 0; b = 0; i = 0
    n = parseInt($('select#fx-quantity').val())
    $('.sumatorias, .ecuacion').empty()
    while i < n
      x = parseFloat($(".input-x-" + i).val())
      y = parseFloat($(".input-y-" + i).val())
      sumXSRoot += x * x
      sumX += x
      sumY += y
      sumXY += x * y
      console.log x, y
      i++
    b = ((n * sumXY) - sumX * sumY)/(n * sumXSRoot - sumX * sumX)
    a = (sumY - b * sumX)/(n)
    $('.sumatorias').append "<h2>Σx = " + sumX + "</h2>"
    $('.sumatorias').append "<h2>Σx = " + sumX + "</h2>"
    $('.sumatorias').append "<h2>Σy = " + sumY + "</h2>"
    $('.sumatorias').append "<h2>Σxy = " + sumXY + "</h2>"
    $('.ecuacion').append "<h2>y = " + a.toFixed(4) + " + " + b.toFixed(4) + "x</h2>"

    return

  $('select#fx-quantity').on 'change', ->
    $('table > tbody').empty()
    quantity = parseInt($(this).val())
    i = 0
    while i < quantity
      $('table > tbody').append "<tr><td><input type='number' value='0' class='input-x-" + i + "'></td>" + "<td><input type='number' value='0' class='input-y-" + i + "'></td></tr>"
      i++
  return

updateMmme = ->
  $memeSelector = $('#memeSelector')
  $topText = $('#top-text')
  $bottomText = $('#bottom-text')

  link = 'http://apimeme.com/meme?' + $.param(
    'meme': $memeSelector.val()
    'top': $topText.val()
    'bottom': $bottomText.val())

  $('#meme-image').attr 'src', link
  $('#meme-link').text(link).attr 'href', link
  $('#download-meme').attr('href', link)
  return

$('#memeForm').change(->
  updateMmme()
  return
).submit ->
  updateMmme()
  false

updateMmme()

otherWindowsMethods = ->
  $('.windows-bar-button').click ->
    $('.menu').toggleClass 'hide'
    $('.windows-bar-inset').toggleClass 'active-button'
    return

  $('.virus').click ->
    $('.windows-app, .windows-bar, .window').glitch
      maxint: 1
      maxglittch: 5
      direction: 'random'
    openAppMethods()
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
  openAppMethods()
  otherWindowsMethods()
  return

internetExplorerHtml = "<div class='window windows-resizable internet-explorer' style='width:800px;'> <div class='header'> <img class='icon' src='/assets/icons/internet-c2f92c7ed7cd9b61234b91d8afa8ae41d9df2a2d079880ab1402c677f08530ab.gif' alt='Internet'> Internet_Explorer.exe <div class='buttons'> <button class='min'>_</button> <button class='max'>☐</button> <button class='bclose'>X</button> </div> </div> <div class='content'> <div class='internet-search'> <input type='text' class='text col-lg-10 url' value='www.yahoo.com'> <button type='button' name='button'>Buscar</button> </div> <iframe src='http://web.archive.org/web/19981212034238/http://www.yahoo.com' class='browser' width='100%' height='100%'></iframe> </div> </div> "
buscaminasHtml = "<div class='window buscaminas-app' style='width:300px;'> <div class='header'> <img class='icon' src='/assets/icons/kmines-16fb982fb490f59281e156264a50ea83d265c0e47eb1199fbde56ef916c5f265.gif' alt='Exe'> KMines.exe <div class='buttons'> <button class='min'>_</button> <button class='max'>☐</button> <button class='bclose'>X</button> </div> </div> <div class='content'> <iframe src='http://buscaminas.eu/' width='100%' height='100%' scrolling='no' ></iframe> </div> </div>"
paintHtml = "<div class='window paint-app'> <div class='header'> <img class='icon' src='/assets/icons/paint-745fc1203e0a06b6cd657b0ac96ae6a5affe81ab4c14b263f3472864ec38c78d.gif' alt='Exe'> Paint.exe <div class='buttons'> <button class='min'>_</button> <button class='max'>☐</button> <button class='bclose'>X</button> </div> </div> <div class='content'> <div class='paint-options'> <div class='pull-right'> <div class='color-picker option-cont' style='background: #000000;'></div> <div class='color-picker option-cont' style='background: #7f7f80;'></div> <div class='color-picker option-cont' style='background: #880015;'></div> <div class='color-picker option-cont' style='background: #ed1c24;'></div> <div class='color-picker option-cont' style='background: #ff7f27;'></div> <div class='color-picker option-cont' style='background: #fff200;'></div> <div class='color-picker option-cont' style='background: #22b14c;'></div> <div class='color-picker option-cont' style='background: #01a2e9;'></div> <div class='color-picker option-cont' style='background: #3e47cc;'></div> <div class='color-picker option-cont' style='background: #a349a4;'></div> </div> <div class='pull-left'> <div class='brush-size option-cont' b-size='4'>●</div> <div class='brush-size option-cont' b-size='8'>●</div> <div class='brush-size option-cont' b-size='12'>●</div> <div class='brush-type option-cont eraser'> <img class='icon' src='/assets/icons/eraser-613934320df6b2cb4199ef6117821e89e05fb59f7404f0c2e05fc54e4df8639c.gif' alt='Eraser'> </div> <div class='brush-type option-cont cross'> <img class='icon' src='/assets/icons/cross-910541ae58b22f1ce6874b1da40bf6625ff0935ae30f1973dfe3ac53bf5d6f34.gif' alt='Cross'> </div> </div> </div> <canvas class='paint-canvas' width='678' height='440'></canvas> </div> </div>"
