alias check-command=/usr/lib/command-not-found

# alias spec='/usr/bin/env ruby -S script/spec -O spec/spec.opts'
alias cuke='./script/cucumber -r features'

alias spc="ruby -Ilib -Ispec"

# some more ls aliases
alias ls='eza'
alias ll='eza -alh'
alias tree='eza --tree --git-ignore'

alias br='bundle exec rails'
alias brs='if [ -f tomtt.env ]; then export $(cat tomtt.env | xargs) && bundle exec rails s; else bundle exec rails s; fi;'
alias be='bundle exec'
alias brk='bundle exec rake'
alias bes='bundle exec rspec'
alias b='be'
alias bi='bundle install'
alias bil='BUNDLE_GEMFILE=`pwd`/Gemfile.local bundle install'

alias mp='mosquitto_pub'
alias ms='mosquitto_sub -v'
alias v='open -avlc'

alias pstree='/usr/local/bin/pstree -g 2'

alias vim=nvim
alias oldvim='NVIM_APPNAME=nvim-tomtt-old vim'
alias lazyvim='NVIM_APPNAME=lazyvim vim'
alias tim='NVIM_APPNAME=nvim-tomtt-lua vim'
alias mvim='NVIM_APPNAME=nvim-minimal vim'

# This allows to issue a quit command which will exit ruby if in ruby, or clear the screen if in a terminal
alias quit="reset"

if command -v bat > /dev/null; then
  alias cat='bat'
fi
    
alias fruittuin='echo -ne "\033]0;fruittuin\007";tmux a -t fruittuin'
alias gabbel_fruittuin='echo -ne "\033]0;gabbel-fruittuin\007";ssh gabbel.fruittuin.nl -t tmux a -t fruittuin-tomtt'
