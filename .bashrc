# ~/.bashrc - Bash configuration for Hyprland rice (Fedora)
# Pastel theme: #f5b8c6 (primary), #fffaa0 (secondary), #aec6cf (tertiary)

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History settings
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alFh --color=auto'
alias la='ls -Ah --color=auto'
alias l='ls -CFh --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'
alias ..='cd ..'
alias ...='cd ../..'
alias tree='tree -C'
alias cat='bat --style=auto 2>/dev/null || cat'
alias update='sudo dnf upgrade --refresh'

# Color support for ls (dircolors)
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Enable bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Wayland / Hyprland environment
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=google-chrome-stable
export TERMINAL=kitty
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Initialize Starship prompt
eval "$(starship init bash)"

# Optional: zoxide for smarter cd
# eval "$(zoxide init bash)"
