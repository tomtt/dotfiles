# Uncomment if linux based (ubuntu, arch, etc..)
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-starship"
plug "chivalryq/git-alias"

alias bex='bundle exec'
alias rc='bex rails c'
alias rs='bex rails s'

if type rg &> /dev/null; then
	export IGNORED_FOLDERS='.git,node_modules,vendor,tmp,cache,package-lock.json'
	export FZF_IGNORED_FOLDERS="--glob '!{$IGNORED_FOLDERS}'"
	export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow $FZF_IGNORED_FOLDERS"
	export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

export EDITOR=nvim
. "$HOME/.asdf/asdf.sh"

# Load and initialise completion system
autoload -Uz compinit
compinit

