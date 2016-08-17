# My Dotfiles.

I keep everything in `~/.etc` and use a rake task to link the contents of `~/.etc/home` to `~/.*`.

I also keep some other crap in here.

Automatically push changes to Github:
```sh
cp ~/.etc/com.ambethia.update_dotfiles.plist ~/Library/LaunchAgents/com.ambethia.update_dotfiles.plist
launchctl load -w ~/Library/LaunchAgents/com.ambethia.update_dotfiles.plist
```

See SETUP.md for more.
