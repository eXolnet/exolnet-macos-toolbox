# exolnet-macos-toolbox

[![MIT License](https://img.shields.io/badge/license-MIT-8469ad.svg)](https://tldrlegal.com/license/mit-license)

eXolnet macOS toolbox.

## Installation

Run the following:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/eXolnet/exolnet-macos-toolbox/master/bootstrap)"
```

## Update

Starting v1.4.0:
```bash
exo-self-update
exo-self-migrate
exo-brew-update
exo-self-reinstall
```

Starting v1.2.0:

```bash
exo-brew-update
exo-self-update
exo-self-reinstall
```

Before v1.2.0:

```bash
brew update && brew upgrade
cd ~/.exolnet/
git pull
./bin/exo-self-update
exo-self-reinstall
```

## Commands

* `exo-brew-update`: Update all homebrew formulae to the latest version, while taking care of properly reinstalling/configuring apache and php when required.
* `exo-cask-install`: Install applications with Homebrew-Cask.
* `exo-php-rebuild`: Reinstall (recompile) all php formulae and reconfigure apache. Use this script to repair your development environment if your php and/or apache stop working. 
* `exo-php-switch`: Switch php version to the specified one.
* `exo-self-migrate`: Apply migration to update current installation for newer version of exolnet-macos-toolbox or homebrew.
* `exo-self-reinstall`: Re-run the exolnet-macos-toolbox install script. Should be run every time after updating and can be run to fix broken installation.
* `exo-self-update`: Update exolnet-macos-toolbox to the latest version.

## Caveats

* Before running, make sure to run `brew update && brew upgrade` if you already have Homebrew installed
  * If you have exolnet-macos-toolbox installed, use `exo-brew-update` instead
* Before installing, make sure to run `xcode-select --install`
* Before installing (first run only), make sure to remove the following package manually:
  * Mysql if not installed with Homebrew
  * Apache versions `homebrew/apache/httpd22` and `homebrew/apache/httpd24` (they have been replaced by `httpd`)
  * Any `php` packages and extensions (they must be built from source)
  * Node if not installed with Homebrew
