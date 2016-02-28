# Lithuania Gophers

Golang user group in Lithuania.

## Install


    hugo server --theme=hyde-x --buildDrafts --watch

First, install [hugo](https://github.com/spf13/hugo/releases). And put it in your **$PATH**.

Install the theme and check necessary dependencies.

    make deps

Update config:

    cp config.toml.dist config.toml

Serve **gophers.lt** on **:1313** port:

    make

## Release

Everytime a change is made to **master** it will be auto deployed to
**gophers.lt** at the moment.
