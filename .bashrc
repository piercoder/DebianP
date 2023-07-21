#======================================================================#
#	 __     ___  __      __   __   __   ___  __
#	|__) | |__  |__)    /  ` /  \ |  \ |__  |__)
#	|    | |___ |  \    \__, \__/ |__/ |___ |  \
#
#	My .bashrc file 
#======================================================================#



#----------------------------------------------------------------------#
# Window size 
#----------------------------------------------------------------------#
shopt -s checkwinsize
#----------------------------------------------------------------------#


#----------------------------------------------------------------------#
# History management
#----------------------------------------------------------------------#
# Append to the history file, don't overwrite it
shopt -s histappend

# save multi-line commands in history as single line
shopt -s cmdhist

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth:erasedups

# History length
HISTSIZE=1000
HISTFILESIZE=2000
#----------------------------------------------------------------------#


#----------------------------------------------------------------------#
# Prompt
#----------------------------------------------------------------------#
# Force colored prompt, if the terminal has the capability
force_color_prompt=yes

PS1="\[\e[36m\]\w\[\e[m\] \[\e[31m\]▶\[\e[m\] "
eval "$(starship init bash)"
#----------------------------------------------------------------------#


#----------------------------------------------------------------------#
# Path
#----------------------------------------------------------------------#
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/stata" ] ; then
    PATH="$PATH:$HOME/.local/stata"
    alias xstata='xstata-se'

fi
#----------------------------------------------------------------------#


#----------------------------------------------------------------------#
# Programmable completion
#----------------------------------------------------------------------#
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#----------------------------------------------------------------------#


#----------------------------------------------------------------------#
# Brew
#----------------------------------------------------------------------#
if [ -d "/home/linuxbrew/" ] ; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	alias brewup='brew update && brew upgrade && brew doctor && brew cleanup'
fi
#----------------------------------------------------------------------#


#----------------------------------------------------------------------#
# Nix
#----------------------------------------------------------------------#
if [ -d "/nix/" ] ; then
	source ~/.nix-profile/etc/profile.d/nix.sh
	alias nixup='nix-env -u'
fi
#----------------------------------------------------------------------#


#----------------------------------------------------------------------#
# Functions
#----------------------------------------------------------------------#
# Clean removed package residual configuration files
cleanup ()
{
  sudo apt autoremove
  sudo apt purge $(dpkg -l | grep "^rc" | awk '{print $2}')
  sudo apt autoremove
}

# Find file
function hunt {
    find / -iname "*$1*" 2>/dev/null
}
#----------------------------------------------------------------------#


#----------------------------------------------------------------------#
# Aliases
#----------------------------------------------------------------------#
# Check if an external file for aliases exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable color support 
alias ls='ls --color=auto'
alias ll='exa -alhg --icons --git --group-directories-first'
alias cat='batcat' 
alias grep='grep --color=auto'

# Other handy aliases
alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'

alias aptup='sudo apt update && sudo apt full-upgrade && sudo apt autoremove'

alias gitup='git add . && git commit -m "Update: $(date)" && git push'

alias dp='cd $HOME/DebianP'
#----------------------------------------------------------------------#

