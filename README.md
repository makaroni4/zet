[![Gem Version](https://badge.fury.io/rb/zet.svg)](https://badge.fury.io/rb/zet)
[![Build Status](https://travis-ci.org/makaroni4/zet.svg?branch=main)](https://travis-ci.org/makaroni4/zet)

# zet

`zet` is a simple gem to generate notes inspired by Zettelkasten method.

`gem install zet`

Create folders `./notes` and `./images`.

Create new notes like `zet note "Niklas Luhmann"`.

## Development

Some useful commands to test changes locally and release a new version:

~~~
Y | gem uninstall zet && gem build zet.gemspec && bundle && rake build && rake release

Y | gem uninstall zet && gem build zet.gemspec && bundle && rake build && rake install
~~~

## License

This project is released under the [MIT License](https://github.com/makaroni4/zet/blob/main/LICENSE.txt).
