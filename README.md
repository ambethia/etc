# My Dotfiles.

I keep everything in `~/.etc` and use a rake task to link the contents of `~/.etc/home` to `~`.
I also keep some other crap in here. I use this to bootstrap computers as well as sync settings between them.

# Setup

- Setup [ETC](https://github.com/ambethia/etc):
  - `xcode-select --install`
  - `git clone https://github.com/ambethia/etc.git ~/.etc`
  - `cd ~/.etc`
  - `rake`

## GitHub

- Add Generated SSH key to [GitHub](https://github.com/settings/ssh). It should already be in the pasteboard.

## Alfred

- Setup [Alfred](https://www.alfredapp.com)
  - Unassign default Spotlight hotkey (⌘-Space) in System Preferences
  - Assign ⌘-Space to Alfred in Alfred's Preferences
  - Activate PowerPack via license in 1Password

# Fonts

- Install [Operator](http://www.typography.com/fonts/operator/overview/) (Mono & SSm)

# Atom

- In Terminal: `apm stars --install`

# Ruby

- `rbenv install 2.4.0` (or whatever is the latest stable release)
- `rbenv global 2.4.0` then open a new Terminal session
