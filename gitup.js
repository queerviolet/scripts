#!/usr/bin/env node
const {execSync} = require('child_process')    
    , sh = (raw, ...cooked) => {
      const cmd = String.raw(raw, ...cooked)
      console.log(cmd)
      return execSync(cmd, {shell: true}).toString()
    }
    , strftime = require('strftime')
    , now = require('strftime')('%Y-%m-%d_%H:%M:%S.%L')
    , {join} = require('path')
    , home = require('os').homedir()
    , ROOT = join(home, 'Google Drive', 'git.bundles')
    , repo = sh `git rev-parse --show-toplevel`
    , bundleDir = join(ROOT, repo).trim()
    , bundleFile = join(bundleDir, `${now}.bundle`)
    , branches = sh `git branch --list | cut -c3-`
        .split('\n')
        .filter(x => x)
        .map(x => `"${x}"`)
        .join(' ')

console.log('-- Bundling branches --')
console.log(branches)
console.log('Creating', bundleDir)
sh `mkdir -p "${bundleDir}"`
console.log('Creating bundle', bundleFile)
sh `git bundle create "${bundleFile}" HEAD ${branches} --`
