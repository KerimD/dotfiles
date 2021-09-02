#          _
#         | |
#  _______| |__  _ __ ___
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__
# /___|___/_| |_|_|  \___|

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
  alias config="/usr/bin/git --git-dir=/home/deniz/dotfiles --work-tree=/home/deniz"
  alias ls="ls -rvh --color --group-directories-first"
  alias ll="ls -l"
  alias start_gnome="XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session"
  alias diff="diff --ignore-space-change --side-by-side --ignore-case --ignore-blank-lines"

# -- PATH ----------------------------------------------------------------------

  export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

# Git Completion

  zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
  fpath=(~/.zsh $fpath)

  autoload -Uz compinit && compinit

# Syntax Highlighting and Autosuggestions

  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Prompt with Git
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' on %F{yellow} %b%f'
 
# idk
setopt PROMPT_SUBST

PROMPT='[%F{blue}%1~%f${vcs_info_msg_0_}]$ '

neofetch | lolcat
