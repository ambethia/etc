#!/usr/bin/env bash

# Use AirDrop over every interface.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Show all filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Only active apps on the dock
defaults write com.apple.dock static-only -bool TRUE

# Dock hiding.
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 1

killall Dock
