# Get the width and height of the viewport
w = document.documentElement.clientWidth
h = document.documentElement.clientHeight

# Set the number of stars that appear on the screen
starsCount = 100


randomIntBetween = (a, b) ->
  Math.floor Math.random() * (b - a + 1) + a

# Random sparkling frames
generateRandomSparklingFrames = (steps, minOpacity, maxOpacity) ->
  opacity = []
  percent = []
  i = 0
  while i < steps
    loop
      opacity[i] = Math.random().toFixed(2)
      unless opacity[i] < minOpacity or opacity[i] > maxOpacity
        break
    percent[i] = randomIntBetween(1, 99)
    i++
  percent.sort()
  rule = '0% { opacity: ' + opacity[0] + '} '
  i = 0
  while i < steps
    rule += percent[i] + '% { opacity: ' + opacity[i] + '} '
    i++
  rule += '100% { opacity: ' + opacity[0] + '} '
  rule

# Dynamically insert keyframes into CSS
insertStarRule = (name, numSteps, minOpacity, maxOpacity, animationTimeMin, animationTimeMax) ->
  # We need to take the default style sheet
  CSS = document.styleSheets[0]
  
  if CSS.insertRule
    try
      CSS.insertRule '@-webkit-keyframes ' + name + '{ ' + generateRandomSparklingFrames(numSteps, minOpacity, maxOpacity) + '}', CSS.cssRules.length
      CSS.insertRule '.' + name + ' { -webkit-animation: ' + name + ' ' + randomIntBetween(animationTimeMin, animationTimeMax) + 's infinite }', CSS.cssRules.length
    catch e
    try
      CSS.insertRule '@keyframes ' + name + '{ ' + generateRandomSparklingFrames(numSteps, minOpacity, maxOpacity) + '}', CSS.cssRules.length
      CSS.insertRule '.' + name + ' {animation: ' + name + ' ' + randomIntBetween(animationTimeMin, animationTimeMax) + 's infinite }', CSS.cssRules.length
    catch e
  if CSS.addRule
    try
      CSS.addRule '@-webkit-keyframes ' + name, generateRandomSparklingFrames(numSteps, minOpacity, maxOpacity)
      CSS.addRule '.' + name, '-webkit-animation: ' + name + ' ' + randomIntBetween(animationTimeMin, animationTimeMax) + 's infinite'
    catch e
    try
      CSS.addRule '@keyframes ' + name, generateRandomSparklingFrames(numSteps, minOpacity, maxOpacity)
      CSS.addRule '.' + name, 'animation: ' + name + ' ' + randomIntBetween(animationTimeMin, animationTimeMax) + 's infinite'
    catch e
  return

# Add the stars to the view
n = 1
while n <= starsCount
  insertStarRule 's' + n, 5, .1, 1, 3, 6
  n++

# Animate the stars
i = 0
while i < starsCount
  size = randomIntBetween(5, 12)
  x = Math.min(randomIntBetween(1, w), w - size - 5)
  y = Math.min(randomIntBetween(1, h), h - size - 5)
  elem = $('<div class=\'star\'></div>')
  elem.css
    'top': y
    'left': x
    'width': size
    'height': size
  elem.addClass 's' + randomIntBetween(1, starsCount)
  $('#stars-wrapper').append elem
  i++

# Get and set the current URL location
location = document.getElementById('location')
hostname = window.location.hostname
location.href = 'http://' + hostname
location.title = hostname
location.innerHTML = hostname