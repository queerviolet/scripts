#!/usr/bin/env node

const OBS = require('./obs')

if (module === require.main) {
  let {title, description, channel} = require('commander')
    .option('-t, --title [title]', 'Stream title', `${process.env.USER}'s livestream`)
    .option('-d, --description [description]', 'Stream description', '')
    .option('-c, --channel [channel]', 'Slack channel', process.env.COHORT_SLACK)
    .parse(process.argv)
  
  if (channel)
    description += `\n\nCohort: ${channel}`
  console.log('channel=', channel)

  require('livestream')({
    title, description
  })
    .then(url => {
      console.log(url)    
      const WebClient = require('@slack/client').WebClient
      return new Promise((resolve, reject) =>
        new WebClient(process.env.SLACK_API_TOKEN)
          .chat.postMessage(channel,
            `Livestream for ${title}: ${url}`, (err, ok) =>
            err ? reject(err) : resolve(ok)))
    })
    .then(() => {
      console.log(`Slacked ${channel}`)      
    })    
    .then(OBS.start)
    .then(() => process.exit(0))
    .catch(err => {
      console.error(err)
      process.exit(1)
    })
}
