# Livestream

A command line tool to set the metadata for your default Youtube Live stream.

## From the command line

```sh
livestream --title "Test livestream" --description "Here's my livestream. Isn't it great?"
```

This will print out the view URL.

## From node

```js
require('livestream')({
    title: 'My livestream',
    description: 'In which I complain about many things',  
  })
  .then(url => {
    console.log('stream url:', url)
  })
  .catch(console.error)
```

The parameters we accept are:

```js
async livestream({
  title?: String,
  description?: String,
  interactive=true: Bool,
  partition='persist: livestream': String
}) ~> url: String
```

You need `interactive` to be true the first time you call this function. Otherwise, you won't be able to log in.

## This is all a bit nightmarish

We use [Nightmare](http://www.nightmarejs.org/) to set the stream metadata. This is hackish, and arguably weird, but is has the benefit of working and being very quick to write.

The Youtube API would be better in some abstract sense, but it doesn't have an obvious way to manipulate the default stream. You can *create* streams, but these will all have their own stream keys, which I'd have to wire into [my stream software](https://obsproject.com/), which doesn't have a remote access API, because of course it doesn't.

Also, this command would probably require an API key, which you'd have to dig into the developer's console to create, and then you'd probably have to do something with OAuth, and as is well known, doing nothing with OAuth is vastly superior to doing anything with OAuth, and anyway, I stopped caring about finding a better approach two sentences into the first paragraph.