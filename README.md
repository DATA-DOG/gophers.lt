# Lithuania Gophers

Golang user group in Lithuania.

## Install

First, install [hugo](https://github.com/spf13/hugo/releases). And put
it in your **$PATH**.

Install the theme and check necessary dependencies. (optional) theme is
shipped with git source tree.

    make deps

Update config:

    cp config.toml.dist config.toml

Serve on **:1313** port:

    make

Or simply:

    hugo server --theme=hyde-x --buildDrafts --watch

## Release

Everytime a change is made to **master** it will be auto deployed to
**gophers.lt** at the moment.
