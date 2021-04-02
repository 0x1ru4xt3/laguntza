# Laguntza
Script created to show a personalized help-page in order to avoid always searching in the browser for the same command.

## Supported helps
* System update and upgrading
* i3 configuration
* Extracting
* Creating extracted files
* Install new programs
* Add new alias

## Installation
```
sh install.sh
```
When finished, restart Shell configuration, for example for ZSH:
```
source ~/.zshrc
```

## Configuration
A configuration file named 'conf' lists all supported helps. Those lines starting with '#' are ignored and the rest are shown. This is configured in the installation but can be changed at any moment.
