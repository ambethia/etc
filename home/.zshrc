# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Antigen

eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
source $(brew --prefix)/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<-BUNDLES
  git
  heroku
  osx
  ssh-agent
  mafredri/zsh-async
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
BUNDLES

antigen theme romkatv/powerlevel10k

antigen apply

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa

autoload -U promptinit; promptinit
prompt pure

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

eval "$(direnv hook zsh)"
eval "$(rbenv init -)"
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
