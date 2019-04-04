# exolnet-macos-toolbox

[![MIT License](https://img.shields.io/badge/license-MIT-8469ad.svg)](https://tldrlegal.com/license/mit-license)

eXolnet macOS toolbox.

## Installation

Run the following:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/eXolnet/exolnet-macos-toolbox/master/bootstrap)"
```

## Update

```bash
exo-self-update
exo-self-migrate
exo-brew-update
```

## Commands

* `exo-brew-update`: Update all homebrew formulae to the latest version, while taking care of properly reinstalling/configuring apache and php when required.
* `exo-php-rebuild`: Reinstall (recompile) all php formulae and reconfigure apache. Use this script to repair your development environment if your php and/or apache stop working. 
* `exo-php-switch`: Switch php version to the specified one.
* `exo-self-migrate`: Apply migration to update current installation for newer version of exolnet-macos-toolbox or homebrew.
* `exo-self-update`: Update exolnet-macos-toolbox to the latest version.
* `exo-software-select`: Select which software to install. Preferences are saved locally.
* `exo-software-install`: Install selected software. Can be run to fix broken installation.

## Caveats

* Before running, make sure to run `brew update && brew upgrade` if you already have Homebrew installed
  * If you have exolnet-macos-toolbox installed, use `exo-brew-update` instead
* Before installing (first run only), make sure to remove the following package manually:
  * Apache, Mysql, Node or PHP if not installed with Homebrew
