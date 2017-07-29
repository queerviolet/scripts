#!/usr/bin/env node

const express = require('express')
    , {promisify} = require('util')
    , read = promisify(require('fs').readFile)
    , {parse} = require('fountain-js')

const server = express()
  .get('/:path', (req, res, next) =>
    read(`${req.params.path}.fountain`)
      .then(parse)
      .then(ast => res.json(ast))
      .catch(next))
  .listen()
  .on('listening', () => console.log(server.address()))