#!/usr/bin/env node

const channel = process.env.COHORT_SLACK || 'hooktest'

if (module === require.main) {
  let {title, description} = require('commander')
    .option('-t, --title [title]', 'Stream title')
    .option('-d, --description [description]', 'Stream description')
    .parse(process.argv)
  
  const {COHORT} = process.env
  if (COHORT)
    description += `\nCohort: ${COHORT}`

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
      process.exit(0)
    })
    .catch(err => {
      console.error(err)
      process.exit(1)
    })
}