[![Gem Version](https://badge.fury.io/rb/imgzet.svg)](https://badge.fury.io/rb/imgzet)
[![Build Status](https://travis-ci.org/makaroni4/imgzet.svg?branch=main)](https://travis-ci.org/makaroni4/imgzet)

# imgzet

`imgzet` is a simple gem to generate notes inspired by Imgzettelkasten method.

`gem install imgzet`

Create folders `./notes` and `./images`.

Create new notes like `imgzet note "Niklas Luhmann"`.

## Development

Some useful commands to test changes locally and release a new version:

~~~
Y | gem uninstall imgzet && gem build imgzet.gemspec && bundle && rake build && rake release

Y | gem uninstall imgzet && gem build imgzet.gemspec && bundle && rake build && rake install
~~~

## License

This project is released under the [MIT License](https://github.com/makaroni4/imgzet/blob/main/LICENSE.txt).
