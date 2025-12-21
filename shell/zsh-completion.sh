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

zstyle ':completion:*' menu select interactive
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
