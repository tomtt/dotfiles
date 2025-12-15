export PATH="$HOME/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$HOME/.rbenv/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init - --no-rehash zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH=~/.rbenv/completions:"$FPATH"

autoload -U compinit
compinit

export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'
