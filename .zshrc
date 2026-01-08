# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
# plug "zap-zsh/supercharge"
# plug "zap-zsh/exa"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-starship"
# plug "chivalryq/git-alias"
plug "jeffreytse/zsh-vi-mode"
plug "Aloxaf/fzf-tab"

source ~/dotfiles/shell/zsh-preferences.sh
# source ~/dotfiles/shell/zsh-completion.sh
source ~/dotfiles/shell/zsh-fzf-completion.sh
source ~/dotfiles/shell/shell-setup.sh
source ~/dotfiles/shell/aliases.sh
source ~/dotfiles/shell/git-aliases.sh
