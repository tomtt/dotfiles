# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-starship"
plug "chivalryq/git-alias"

# Callbell
alias bex='bundle exec'
alias rc='bex rails c'
alias rubocop='bex rubocop'
alias rspec='bex rspec'
alias fs='foreman start'
alias callbell=~/apps/callbell

export PATH="$HOME/.tmuxifier/bin:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export EDITOR=nvim

 . /opt/homebrew/opt/asdf/libexec/asdf.sh


services() {
	brew services $1 nginx
	brew services $1 redis
	brew services $1 postgresql@14
}

go_run() {
	if [ "$1" = 'gupshup' ]; then
		go run cmd/whatsappbusinessapi/main.go
	elif [ "$1" = 'cloud' ]; then
		go run cmd/whatsappcloudapi/main.go --verify-token=mytokenlala --meta-cloud-app-secret=supersecret
	else
		echo '(gupshup or cloud) only'
		exit 1
	fi
}
# ---------

export PYTHON3_LOCATION="$(which python3)"

if type rg &> /dev/null; then
	export IGNORED_FOLDERS='.git,node_modules,vendor,tmp,cache,package-lock.json'
	export FZF_IGNORED_FOLDERS="--glob '!{$IGNORED_FOLDERS}'"
	export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow $FZF_IGNORED_FOLDERS"
	export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

eval "$(tmuxifier init -)"

# Load and initialise completion system
autoload -Uz compinit
compinit

