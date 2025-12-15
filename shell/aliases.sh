alias check-command=/usr/lib/command-not-found

# alias spec='/usr/bin/env ruby -S script/spec -O spec/spec.opts'
alias cuke='./script/cucumber -r features'

alias spc="ruby -Ilib -Ispec"

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
#alias l='ls -CF'
alias ls='ls -F'

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
alias gtlg='gtlg -n 20'
alias gtlgr='gtlg -p -r -a -m -l 58' alias gt-branch-todo="gtlg -m -s 0|sed -e 's/^\ *\-\?[0-9]\+ /* [ ]/'|tac"

alias vim=nvim
alias oldvim='NVIM_APPNAME=nvim-tomtt-old vim'
alias lazyvim='NVIM_APPNAME=lazyvim vim'
alias tim='NVIM_APPNAME=nvim-tomtt-lua vim'

alias fruittuin='echo -ne "\033]0;fruittuin\007";tmux a -t fruittuin'
alias gabbel_fruittuin='echo -ne "\033]0;gabbel-fruittuin\007";ssh gabbel.fruittuin.nl -t tmux a -t fruittuin-tomtt'
