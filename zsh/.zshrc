#!/usr/bin/env zsh

# Load prompt
source "${HOME}/.zsh/prompt.zsh"

# Load syntax highlighting
source "${HOME}/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

if [[ "$(tput colors)" == "256" ]]; then
    ZSH_HIGHLIGHT_STYLES[default]=none
    ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=001
    ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=037
    ZSH_HIGHLIGHT_STYLES[alias]=fg=002
    ZSH_HIGHLIGHT_STYLES[builtin]=fg=002
    ZSH_HIGHLIGHT_STYLES[function]=fg=002
    ZSH_HIGHLIGHT_STYLES[command]=fg=002
    ZSH_HIGHLIGHT_STYLES[precommand]=fg=002,underline
    ZSH_HIGHLIGHT_STYLES[commandseparator]=none
    ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=037
    ZSH_HIGHLIGHT_STYLES[path]=fg=009,underline
    ZSH_HIGHLIGHT_STYLES[globbing]=fg=033
    ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
    ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=005
    ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=005
    ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
    ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=003
    ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=003
    ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=003
    ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=003
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
KEYTIMEOUT=50 # Corresponds to 50ms

# Use Vim as default editor
export EDITOR=vim
# Use Vim mode in Zsh
bindkey -v
# Easier escape to normal mode
bindkey -M viins 'jk' vi-cmd-mode

# Use FZF to search history
bindkey "^R" history-incremental-search-backward
# Use FZF to change directory
bindkey "^O" fzf-cd-widget

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Edit command line in Vim
bindkey -a '^E' edit-command-line

# Disable shell builtins
disable r

# Aliases
source "${HOME}/.zsh/aliases.zsh"

# Use Gruvbox for bat
export BAT_THEME="gruvbox-dark"
# Use Gruvbox for ls
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# Use Bat for manpages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Make breakpoint builtin in Python use ipdb
export PYTHONBREAKPOINT="ipdb.set_trace"
