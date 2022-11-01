#!/usr/bin/env zsh

alias pgs="pg_ctl -D postgres start"
alias pgx="pg_ctl -D postgres stop"

alias rs="redis-server /opt/homebrew/etc/redis.conf"
alias rx="killall -SIGTERM redis-server"

alias etc="code ~/.etc"

alias git=hub

alias gg="git add .; git commit -m 'Update'  -m 'A lazy commit.'; git push origin"

alias random-word='sed `perl -e "print int rand(99999)"`"q;d" /usr/share/dict/words'

alias ip="curl https://canhazip.com"

alias ls='lsd'
alias l='ls -1'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
