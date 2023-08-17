# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B[%n@%M %{$fg[blue]%}%~%{$reset_color%}]$%b "
setopt autocd
unsetopt PROMPT_SP
stty stop undef

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000000
SAVEHIST=10000000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

source "$HOME/.config/sh/aliases"
source "$HOME/.config/sh/functions"
export GPG_TTY=$(tty)

