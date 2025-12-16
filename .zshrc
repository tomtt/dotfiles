# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-starship"
# plug "chivalryq/git-alias"
plug "jeffreytse/zsh-vi-mode"

ZVM_SYSTEM_CLIPBOARD_ENABLED=true
ZVM_VI_INSERT_ESCAPE_BINDKEY=kj

# Completion section. Reference: https://thevaluable.dev/zsh-completion-guide-examples/
# Load more completions
fpath=($DOTFILES/zsh/plugins/zsh-completions/src $fpath)

# Should be called before compinit
zmodload zsh/complist

bindkey -M menuselect '^xg' clear-screen
bindkey -M menuselect '^xi' vi-insert                      # Insert
bindkey -M menuselect '^xh' accept-and-hold                # Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
bindkey -M menuselect '^xu' undo                           # Undo

# Load and initialise completion system
autoload -Uz compinit
compinit
_comp_options+=(globdots) # With hidden files

# enable vim-style editing mode
bindkey -v
# esc with homerow keys out of insert mode
# bindkey -M viins 'kj' vi-cmd-mode
# Ensure ^J is not bound since it is my tmux prefix
bindkey -r "^J"

zstyle ':completion:*' menu select interactive
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

source ~/dotfiles/shell/shell-setup.sh
source ~/dotfiles/shell/aliases.sh
source ~/dotfiles/shell/git-aliases.sh
