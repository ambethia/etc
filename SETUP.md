# Applications

- [Opera Developer](http://www.opera.com/computer/beta)
  - Enable [Chrome Extensions](https://addons.opera.com/en/extensions/details/download-chrome-extension-9)
- [1Password](https://my.1password.com) (install beta extension for Opera)
- [Atom](https://atom.io)
- [Hyper](https://hyper.is)
- [Alfred](https://www.alfredapp.com)
  - Unassign default Spotlight hotkey (⌘-Space) in System Preferences
  - Assign ⌘-Space to Alfred in Alfred's Preferences
  - Activate PowerPack via license in 1Password
- [Slack](https://slack.com/downloads)

# Misc

- Install [Operator](http://www.typography.com/fonts/operator/overview/) (Mono & SSm)

# Setup Development Environment

- Setup a new SSH Key:
  - `ssh-keygen -t rsa -b 4096 -C "jasper@ambethia.com"`
  - `pbcopy < ~/.ssh/id_rsa.pub`
  - Add to [GitHub](https://github.com/settings/ssh).
- Install Homebrew:
  - `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- `brew install git hub`
- Setup [ETC](https://github.com/ambethia/etc):
  - `git clone git@github.com:ambethia/etc.git ~/.etc`
  - `cd ~/.etc`
  - `rake`
  - `git submodule update --init`
  - `mkdir -p ~/Library/LaunchAgents`
  - `cp ~/.etc/com.ambethia.update_dotfiles.plist ~/Library/LaunchAgents/com.ambethia.update_dotfiles.plist`
- ZSH:
  - `brew install zsh`
  - `sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh`
- Install misc utilities used in my environment:
  - `brew install direnv thefuck tmux trash terminal-notifier`
  - `brew linkapps terminal-notifier`
- Open a new Terminal session. **BOOM!**

# Setup Atom

- Open Atom
- Atom > Install Shell Commands
- In Terminal: `apm stars --install`
- Restart Atom **BOOM!**

# "Programming Motherfucker"

## Ruby

- `brew install rbenv`
- `rbenv install 2.3.1` (or whatever is the latest stable release)
- `rbenv global 2.3.1` then open a new Terminal session
- `gem install bundler` **BOOM!**

## JavaScript

- `brew install node`
- Install [React Dev Tools](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi)
- **BOOM!**

TODO: More languages.

# Reclaim Space!

## Remove Apple Bloat

```sh
sudo trash /Applications/GarageBand.app
sudo trash /Library/Application\ Support/GarageBand
sudo trash /Library/Application\ Support/Logic/
sudo trash /Library/Audio/Apple\ Loops
sudo trash /Library/Audio/Apple\ Loops\ Index
```
~ 3.2GB

```sh
sudo trash /Applications/iMovie.app
sudo trash /Applications/Keynote.app
sudo trash /Applications/Numbers.app
sudo trash /Applications/Pages.app
```

_another_ 3GB recovered.
