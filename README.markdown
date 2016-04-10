# Clack-Static-Asset-Middleware
[![Build Status](https://travis-ci.org/fisxoj/clack-static-asset-middleware.svg?branch=master)](https://travis-ci.org/fisxoj/clack-static-asset-middleware) [![Coverage Status](https://coveralls.io/repos/github/fisxoj/clack-static-asset-middleware/badge.svg?branch=master)](https://coveralls.io/github/fisxoj/clack-static-asset-middleware?branch=master)

The static asset middleware is for handling versioned static assets.  That means that, when the assets of your webapp change, it will be referred to by a different filename, allowing a browser to instantly know that it needs to download a new file.  Assets are served with the maximum cache time headers set so browsers will never ask for them again.

This will, evetually, define helpers for templating engines in sub-packages that allow for easy insertion of static asset filenames into templates, like djula.

## Usage

    At this time, `clack-static-asset-middleware` is not usable.  Give me another week or two.
## Installation

    `clack-static-asset-middleware` is not yet in quicklisp, so clone it into your quicklisp `local-projects` directory. Then, run

    ```lisp
    (ql:quickload :clack-static-asset-middleware)
    ```

    or refer to it in your system definition

    ```lisp
    (asdf:defsystem my-great-webapp
        ...
        :depends-on (#:clack-static-asset-middleware)
        ..
        )
    ```


## Author

* Matt Novenstern (fisxoj@gmail.com)

## Copyright

Copyright (c) 2016 Matt Novenstern (fisxoj@gmail.com)

## License

Licensed under the MIT License.
