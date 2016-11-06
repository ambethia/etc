# My Dotfiles.

I keep everything in `~/.etc` and use a rake task to link the contents of `~/.etc/home` to `~/.*`.
I also keep some other crap in here. I use this to bootstrap computers as well as sync settings between them.

# Setup

- Setup [ETC](https://github.com/ambethia/etc):
  - `git clone https://github.com/ambethia/etc.git ~/.etc`
  - `cd ~/.etc`
  - `git submodule update --init`
  - `rake`
- Add Generated SSH key to [GitHub](https://github.com/settings/ssh). It should already be in the pasteboard.
- Switch defaul shell to ZSH:
  - `sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh`

See [SETUP.md](SETUP.md) for more.
