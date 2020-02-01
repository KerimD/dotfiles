#          _
#         | |
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
PROMPT='[%F{green}%1~%f]$ '

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh

# -- ALIAS ---------------------------------------------------------------------

  alias v="nvim"
  alias sv="sudo nvim -u /home/deniz/.config/nvim/cleaner.vim"
  alias sp="sudo pacman"
  alias c="clear"
  alias py="python3"
  alias google="google-chrome-stable"
  alias config="/usr/bin/git --git-dir=/home/deniz/dotfiles --work-tree=/home/deniz"
  alias ls="ls -rvh --color --group-directories-first"
  alias start_gnome="XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session"
  alias diff="diff --ignore-space-change --side-by-side --ignore-case --ignore-blank-lines"

# -- PATH --

export PATH="$HOME/bin:$PATH"

neofetch | lolcat
