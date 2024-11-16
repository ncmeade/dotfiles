#!/usr/bin/env bash
# Minimal Prompt:
source ~/.zsh/prompt.zsh

# Load syntax highlighting
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ "$(tput colors)" == "256" ]]; then
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=160
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=037,bold #,standout
    ZSH_HIGHLIGHT_STYLES[alias]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[function]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[command]=fg=064,bold
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=064,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=none
    ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=037
    ZSH_HIGHLIGHT_STYLES[path]=fg=166,underline
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=033
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=125,bold
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=125,bold
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=136
    ZSH_HIGHLIGHT_STYLES[assign]=fg=037
    ZSH_HIGHLIGHT_STYLES[comment]=fg=246
fi

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Initialize completion
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select=4
zmodload zsh/complist

# Use Vim style navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Initialize editing command line
autoload -U edit-command-line && zle -N edit-command-line

# Enable interactive comments (# on the command line)
setopt INTERACTIVE_COMMENTS

# History
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
# Append to history file
setopt APPEND_HISTORY
# Write to the history file immediately
setopt INC_APPEND_HISTORY
# Use more verbose format for entries 
setopt EXTENDED_HISTORY
# Don't log commands that start with a space
setopt HIST_IGNORE_SPACE
# Share history between sessions
setopt SHARE_HISTORY

# Time to wait for additional characters in a sequence
KEYTIMEOUT=1 # Corresponds to 10ms

# Use vim as the editor
export EDITOR=vim

# Use Vim style line editing in zsh
bindkey -v

# Use incremental search
bindkey "^R" history-incremental-search-backward

# Edit command line in Vim
bindkey -a '^E' edit-command-line

# Disable shell builtins
disable r

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
source ~/.zsh/aliases.sh

# Add virtualenv to PATH
export PATH=$PATH:$HOME/Library/Python/3.10/bin

# Use more minimal prompt
export PROMPT_MODE=1
export RPR_SHOW_GIT=(false, false)

# Use Solarized theme for bat
export BAT_THEME="Solarized (dark)"

# Use bat for man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Make breakpoint builtin in Python use ipdb
export PYTHONBREAKPOINT="ipdb.set_trace"
