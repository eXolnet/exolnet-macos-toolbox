# exolnet-macos-toolbox

[![MIT License](https://img.shields.io/badge/license-MIT-8469ad.svg)](https://tldrlegal.com/license/mit-license)

eXolnet macOS toolbox.

## Installation

Run the following:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/eXolnet/exolnet-macos-toolbox/master/bootstrap)"
```

You can also pre-select another profile on installation
```bash
PROFILE=conference-room bash -c "$(curl -fsSL https://raw.githubusercontent.com/eXolnet/exolnet-macos-toolbox/master/bootstrap)"
```

## Update

```bash
exo-self-update
exo-self-migrate
exo-brew-update
exo-php-rebuild
```

## Commands

* `exo-brew-update`: Update all Homebrew formulae to the latest version, while taking care of properly reinstalling/configuring apache and php when required.
* `exo-php-extension`: List enabled or toggle php extension for the current php version.
* `exo-php-initialize`: Initialize php version for the current directory and configure the apache php version for the given slug.
* `exo-php-rebuild`: Reinstall all php formulae, recompile all php extensions and reconfigure apache. Use this script to repair your development environment if your php and/or apache stop working. Should also be run after updating Homebrew.
* `exo-self-migrate`: Apply migration to update current installation for newer version of exolnet-macos-toolbox or Homebrew.
* `exo-self-test`: Run tests on exolnet-macos-toolbox.
* `exo-self-update`: Update exolnet-macos-toolbox to the latest version.
* `exo-software-install`: Install selected software. Can be run to fix broken installation.
* `exo-software-select`: Select which software to install. Preferences are saved locally.
* `exo-xcode-update`: Trigger a CommandLineTools update and install the latest version (if any).

## Caveats

* Before running, make sure to run `brew update && brew upgrade` if you already have Homebrew installed
  * If you have exolnet-macos-toolbox installed, use `exo-brew-update` instead
* Before installing (first run only), make sure to remove the following package manually:
  * Apache, Mysql, Node or PHP if not installed with Homebrew

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) and [CODE OF CONDUCT](CODE_OF_CONDUCT.md) for details.

## Security

If you discover any security related issues, please email security@exolnet.com instead of using the issue tracker.

## Credits

- [Patricia Gagnon-Renaud](https://github.com/pgrenaud)
- [All Contributors](../../contributors)

## License

This code is licensed under the [MIT license](http://choosealicense.com/licenses/mit/).
Please see the [license file](LICENSE) for more information.
