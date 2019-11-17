# The size of the history list for a shell session.
HISTSIZE=8192

# We want shell history to persist between sessions.
HISTFILE=~/.history

# How many lines to keep in $HISTFILE.
SAVEHIST=$HISTSIZE

# Append to $HISTFILE after every command.
setopt inc_append_history

# A repeat of previous command is skipped.
setopt hist_ignore_dups

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

export PATH=$HOME/bin:$HOME/.cargo/bin:$HOME/.ghcup/bin:$PATH

export PATH=$PATH:/usr/local/opt/riscv-gnu-toolchain/bin


EDITOR=$(which vim)
VISUAL=$EDITOR
FCEDIT=$EDITOR

. /usr/local/opt/fzf/shell/key-bindings.zsh
. /usr/local/opt/fzf/shell/completion.zsh

export FZF_DEFAULT_COMMAND=fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export LANG=en_US.UTF-8
