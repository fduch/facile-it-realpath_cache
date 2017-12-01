# What is this?
This is fork of [Salvatore Cordiano's repository](https://github.com/salvatorecordiano/facile-it-realpath_cache) with apache http server replaced 
with nginx and ability to test it with usage of $realpath_root variable instead of $document_root for populating SCRIPT_FILENAME
and DOCUMENT_ROOT fastcgi params.

# Is it all PHP OPCache's fault?

This repository contains code showed in the post [Is it all PHP OPCache's fault?](https://engineering.facile.it/blog/eng/realpath-cache-is-it-all-php-opcache-s-fault/) published on [Facile.it Engineering Blog](https://engineering.facile.it).

## Installation

```
$ git clone https://github.com/fduch/facile-it-realpath_cache.git
$ cd facile-it-realpath_cache
$ docker pull fduch/realpath_cache
```

## Shortcuts

- `start.sh` starts the Docker container with the right configuration; 
- `release-switcher.sh` swaps the current release symlink every 10 seconds;
- `release-watcher.sh` checks the current release served by Apache every second, by making an HTTP request.

## Configuration: production

```
# start the container with production configuration with $document_root variable usage
$ ./start.sh production document_root
# .. or with $realpath_root variable usage
# ./start.sh production realpath_root
# start switching the current release
$ ./release-switcher.sh
# start watching the current web server response 
$ ./release-watcher.sh
```

## Configuration: production + opcache disabled

```
# start the container with production configuration and opcache disabled with $document_root variable usage
$ ./start.sh production-no-opcache 
# .. or with $realpath_root variable usage
# ./start.sh production-no-opcache realpath_root
# start switching the current release
$ ./release-switcher.sh
# start watching the current web server response 
$ ./release-watcher.sh
```

## Configuration: production + realpath_cache disabled

```
# start the container with production configuration, opcache enabled and realpath_cache disabled  with $document_root variable usage
$ ./start.sh production-no-realpath-cache
# .. or with $realpath_root variable usage
# ./start.sh production-no-realpath-cache realpath_root
# start switching the current release
$ ./release-switcher.sh
# start watching the current web server response 
$ ./release-watcher.sh
```

## Author

[Salvatore Cordiano](http://twitter.com/parallelit)
[Alex Medvedev](http://twitter.com/fduch)

## License

MIT License

Copyright (c) 2017 Salvatore Cordiano

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
