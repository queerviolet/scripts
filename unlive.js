#!/usr/bin/env node

require('./obs').stop()
  .then(() => console.log('Livestream off.'))
  .catch(console.error)
