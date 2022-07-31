# The size of the history list for a shell session.
HISTSIZE=50000

# We want shell history to persist between sessions.
HISTFILE=~/.history

# How many lines to keep in $HISTFILE.
SAVEHIST=$HISTSIZE

# Append to $HISTFILE after every command.
setopt inc_append_history

# Repeat duplicate commands get skipped.
setopt hist_ignore_dups

# Duplicates get expired first
setopt hist_expire_dups_first

# Using ! doesn't immediately execute selected command
setopt hist_verify

# Record timestamp in history
setopt extended_history

# Remove '/'. So hitting ^W on a path kills only last portion.
WORDCHARS=${WORDCHARS//\/}

# Don't error if glob argument has no matches. Pass argument unevaluated.
setopt nonomatch

# Initialize the completion system.
autoload -U compinit && compinit

# Enable comments for interactive sessions.
setopt interactivecomments

# Bind Alt-; to comment current line. (Or uncomment if starting with '#').
bindkey ";" pound-insert

# Make color constants available.
autoload -U colors && colors

# Only show pwd on the prompt.
setopt promptsubst
export PS1='%{$fg_bold[green]%}%c%{$reset_color%} %# '

export GOPATH=$HOME/go
export PATH=$HOME/bin:$GOPATH/bin:$PATH

EDITOR=$(which nvim)
VISUAL=$EDITOR
FCEDIT=$EDITOR

. $HOMEBREW_PREFIX/opt/fzf/shell/completion.zsh
. $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.zsh

export FZF_DEFAULT_COMMAND=fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export LANG=en_US.UTF-8

alias gs='git switch -'

# Edit command using $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
