exolnet-macos-toolbox
=====================

[![MIT License](https://img.shields.io/badge/license-MIT-8469ad.svg)](https://tldrlegal.com/license/mit-license)

eXolnet macOS toolbox.

Installation
============

Run the following:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/eXolnet/exolnet-macos-toolbox/master/bootstrap)"
```

Caveats
=======

* Before running, make sure to run `brew upgrade` if you already have Homebrew installed.
* Before installing (first run only), make sure to remove the following package manually:
  * Mysql if not installed with Homebrew
  * Apache versions `homebrew/apache/httpd22` and `homebrew/apache/httpd24` (they have been replaced by `httpd`)
  * Any `php` packages and extensions (they must be built from source)
  * Node if not installed with Homebrew
