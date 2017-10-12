module.exports = {
  start: command('osascript', `${__dirname}/start.applescript`),
  stop: command('osascript', `${__dirname}/stop.applescript`),
}

const {execFile} = require('child_process')
    , exec = require('util').promisify(execFile)

function command(cmd, ...args) {
  return (...moreArgs) => exec(cmd, [...args, ...moreArgs])
}