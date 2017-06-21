## Antigen

source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<-BUNDLES
  git
  heroku
  osx
  mafredri/zsh-async
  sindresorhus/pure
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
BUNDLES

antigen apply

## Editor

export EDITOR='atom -w'
export VISUAL='atom -w'
export BUNDLER_EDITOR='atom'

## Path

PATH=/usr/local/bin:/usr/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin

export PATH="$HOME/.etc/bin:$PATH"

export MANPATH=$MANPATH:/opt/local/share/man
export INFOPATH=$INFOPATH:/opt/local/share/info

## Ext

if [ -f ~/.aliases.zsh ]; then
  . ~/.aliases.zsh
fi

if [ -f ~/.private ]; then
  . ~/.private
fi

## Lang

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export ARCHFLAGS="-arch x86_64"

## Node.js

export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:`yarn global bin`"
export PATH="$HOME/.node/bin:$PATH"

## Android

export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_NDK="$HOME/Library/Android/android-ndk-r10e"
export ANDROID_SDK=$ANDROID_HOME

export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

## Hooks

eval "$(direnv hook zsh)"
eval "$(thefuck --alias)"
