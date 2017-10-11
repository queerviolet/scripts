#!/usr/bin/env node

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
  }).then(url => {
    console.log(url)
    process.exit(0)
  }).catch(err => {
    console.error(err)
    process.exit(1)
  })
}