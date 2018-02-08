var span = (span=1, cols=2, op='push') =>
  (direction,
    axis=(direction === 'left' || direction === 'right')
    ? 'X' : 'Y') => slate.operation(op, {
  direction,
  style: `bar-resize:${span}*screenSize${axis}/${cols}`
})

var sizes = [span(1, 2), span(2, 3)]

var lastSizeIdx = 0
var lastDirection = null
var timer = null

function resetTimer() {
  clearTimeout(timer)
  timer = setTimeout(reset, 500)
}

function push(direction) {
  resetTimer()
  if (direction === lastDirection) {
    return sizes[lastSizeIdx = Math.min(sizes.length - 1, lastSizeIdx + 1)](direction)
  }
  lastDirection = direction
  return sizes[lastSizeIdx](direction)
}

function reset() {
  lastSizeIdx = 0
  lastDirection = null
}

slate.bind('1:ctrl,cmd', w => {
  slate.log(w.pid())
})

slate.bind('left:ctrl,alt', w => w.doOperation(push('left')))
slate.bind('right:ctrl,alt', w => w.doOperation(push('right')))
slate.bind('up:ctrl,alt', w => w.doOperation(push('top')))
slate.bind('down:ctrl,alt', w => w.doOperation(push('bottom')))
