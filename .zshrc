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




# Load and initialise completion system
autoload -Uz compinit
compinit

# enable vim-style editing mode
bindkey -v
# esc with homerow keys out of insert mode
# bindkey -M viins 'kj' vi-cmd-mode
# Ensure ^J is not bound since it is my tmux prefix
bindkey -r "^J"

source ~/dotfiles/shell/shell-setup.sh
source ~/dotfiles/shell/aliases.sh
source ~/dotfiles/shell/git-aliases.sh
