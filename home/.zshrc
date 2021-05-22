## Antigen

source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<-BUNDLES
  git
  heroku
  osx
  ssh-agent
  mafredri/zsh-async
  sindresorhus/pure
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
BUNDLES

antigen apply

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa

## Editor

export EDITOR='code -w'
export VISUAL='code -w'
export BUNDLER_EDITOR='code'

## Path
export PATH="$HOME/bin:$PATH"
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

## Hooks

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"

