zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit colors
compinit
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify HIST_IGNORE_DUPS
unsetopt beep
bindkey -e

# Foreground: #f2f2f2
# Background: #27292C
# Cursor: #C7C7C7
# Palette: #000000:#C20C0C:#27d316:#C4C71A:#2a50d5:#c414c6:#3894d2:#c7c7c7:#686868:#f96a6a:#71fe6c:#fcfe6e:#716afd:#fc6cfe:#5cc7c7:#ffffff
# Default colors: exfxcxdxbxegedabagacad

# Check if colors are available and define. Stolen from http://aperiodic.net/phil/prompt/
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
  for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
      eval PR_LIGHT_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
      eval PR_$color='%{$fg[${(L)color}]%}'
      (( count = $count + 1 ))
  done
  PR_COLOR_RESET="%{$terminfo[sgr0]%}"
  export TERM=xterm-256color
fi

## Define zsh prompt
export PROMPT="$PR_LIGHT_CYAN%~$PR_COLOR_RESET
%(?.$PR_GREEN%# $PR_COLOR_RESET.$PR_RED%# $PR_COLOR_RESET)"

## Editor info
export EDITOR=emacs

## Linux-specific
if [[ `uname -s` == Linux ]]; then
   alias emacs='emacs -nw'
   alias sudo='sudo '
   alias ls='ls --color=auto'
   export LS_COLORS='di=01;96:ex=92:ln=95:'
fi

## OS X-specific
if [[ `uname -s` == Darwin ]]; then
  export CLICOLOR=1
  export LSCOLORS=GxfxBxxxcxbxBxxxaxaxaH
  export HOMEBREW_EDITOR=emacs
  export PATH=/usr/local/opt/ruby/bin:/usr/local/opt/perl/bin:/usr/local/opt/python/bin:$PATH
fi
