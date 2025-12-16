export PATH="$HOME/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$HOME/.rbenv/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Setup homebrew from any of the likely locations it can reside
for brew_bin in \
    "/opt/homebrew/bin/brew" \
    "/usr/local/bin/brew" \
    "/home/linuxbrew/.linuxbrew/bin/brew"
do
    if [[ -x "$brew_bin" ]]; then
        eval "$("$brew_bin" shellenv)"
        break
    fi
done

eval "$(rbenv init - --no-rehash zsh)"
FPATH=~/.rbenv/completions:"$FPATH"

autoload -U compinit
compinit

export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'
export LANG=en_US.utf-8
