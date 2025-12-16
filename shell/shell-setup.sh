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

if type rg &> /dev/null; then
	export IGNORED_FOLDERS='.git,node_modules,vendor,tmp,cache,package-lock.json'
	export FZF_IGNORED_FOLDERS="--glob '!{$IGNORED_FOLDERS}'"
	export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow $FZF_IGNORED_FOLDERS"
	export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

export EDITOR=nvim
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

. "$HOME/.asdf/asdf.sh"

source <(fzf --zsh)

eval "$(rbenv init - --no-rehash zsh)"
FPATH=~/.rbenv/completions:"$FPATH"

autoload -U compinit
compinit

export EDITOR=nvim
export VISUAL=nvim
alias vim='nvim'
export LANG=en_US.utf-8
