########################### Path ###########################
export PATH="/bin:/opt/altera/15.0/quartus/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/$USER/bin:/home/$USER/bin/rice"

########################### Options ###########################
#setopt CORRECT              #Spellcheck commands
setopt AUTO_CD              #Automatically cd if entry = dir name
#setopt RM_STAR_WAIT         #Make us wait 10 seconds before deleting
#setopt VI                   #Use vi-like entry
#setopt CSHJUNKIEQUOTES      #Don't let us enter if quotes are not completed
setopt NO_BEEP              #Shut up, computer
setopt NO_FLOW_CONTROL      #Disables ctrl-s (stupid nonsense that "pauses" screen)
setopt EXTENDED_GLOB        #Make glob better
setopt HISTIGNOREDUPS       #Don't save next line if it is the same as prev
#setopt HIST_IGNORE_ALL_DUPS #Don't save ANY repeated commands
setopt HIST_REDUCE_BLANKS   #Pretty    obvious,    right?
setopt SHARE_HISTORY        #Share history between shells
setopt APPEND_HISTORY       #Don't overwrite
setopt EXTENDED_HISTORY     #Save when and how long a command was run
setopt COMPLETEALIASES      #Tab complete aliases

########################### Exports ###########################

# Set EDITOR variable to the best of whatever editor we have
# available
if hash nvim 2>/dev/null; then
    export EDITOR="nvim"
elif hash vim 2>/dev/null; then
    export EDITOR="vim"
else
    export EDITOR="vi"
fi

export ANDROID_HOME=/opt/android-sdk

########################### Assigns ###########################
HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000

########################### Aliases ###########################
#alias upgrade='sudo pacman -Syu && yaourt -Syu --aur'
alias ls='ls --color=auto -F'
alias l='ls -lAh --color=auto'
alias ll='ls -lAh --color=auto'
alias e='$EDITOR'
alias cpv='rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --'
alias svim='sudoedit'
alias upgrade='yaourt -Syu --aur --devel'
alias installfont='sudo fc-cache -f -v'
alias mixer='alsamixer -g'
alias eq='alsamixer -D equal'
alias rm='rm -I'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias h='history | tail'
alias hg='history | grep '
#alias torrent-local='transmission-cli'
#alias torrent-remote='transmission-remote-cli'
#alias torrent='torrent-remote'
alias clip-set='xclip -selection c'
alias clip-get='xclip -o'

# Enable color support
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

########################### Key Bindings ###########################
# So we can use normal bash shortcuts instead of vim
bindkey -e

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

bindkey -M vicmd "q" push-line

# Ensure that arrow keys work as they should
bindkey '\e[A' up-line-or-history
bindkey '\e[B' down-line-or-history

bindkey '\eOA' up-line-or-history
bindkey '\eOB' down-line-or-history

bindkey '\e[C' forward-char
bindkey '\e[D' backward-char

bindkey '\eOC' forward-char
bindkey '\eOD' backward-char

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo

# Rebind the insert key.  I really can't stand what it currently does.
bindkey '\e[2~' overwrite-mode

# Rebind the delete key. Again, useless.
bindkey '\e[3~' delete-char

bindkey -M vicmd '!' edit-command-output

# it's like, space AND completion.
bindkey -M viins ' ' magic-space

########################### Macros ###########################
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

conf() {
    case $1 in
        mpd)        vim ~/.mpdconf ;;
        i3)         vim ~/.i3/config ;;
        mutt)       vim ~/.mutt/acct/wei001 ;;
        ncmpcpp)    vim ~/.ncmpcpp/config ;;
        pacman)     svim /etc/pacman.conf ;;
        tmux)       vim ~/.tmux.conf ;;
        vim)        vim ~/.vimrc ;;
        xinit)      vim ~/.xinitrc ;;
        xresources) vim ~/.Xresources && xrdb ~/.Xresources ;;
        tint2)      vim ~/.config/tint2/xmonad.tint2rc ;;
        zsh)        vim ~/.zshrc && source ~/.zshrc ;;
        ssh)        vim ~/.ssh/config ;;
        hosts)      sudoedit /etc/hosts ;;
        *)          echo "Unknown application: $1" ;;
    esac
}

########################### Prompt style ###########################
# Depends on the git plugin for work_in_progress()

#ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
#ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_CLEAN=""
#
##Customized git status, oh-my-zsh currently does not allow render dirty status before branch
#git_custom_status() {
#  local cb=$(git_current_branch)
#  if [ -n "$cb" ]; then
#    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
#  fi
#}
#
## RVM component of prompt
#ZSH_THEME_RVM_PROMPT_PREFIX="%{$fg[red]%}["
#ZSH_THEME_RVM_PROMPT_SUFFIX="]%{$reset_color%}"
#
## Combine it all into a final right-side prompt
#RPS1='$(git_custom_status)$(ruby_prompt_info) $EPS1'
#
#PROMPT='%{$fg[cyan]%}[%~% ]%(?.%{$fg[green]%}.%{$fg[red]%})%B$%b '

########################### Misc ###########################
# Disable x11's ugly passphrase prompt
unset SSH_ASKPASS

# Make the cursor be a block
echo -en "\033[1 q"

# Enable git completion
# autoload -U compinit && compinit

########################### Oh-my-zsh ###########################
# OMZ is optional, I only use it for the neat plugins

export ZSH=/home/$USER/.oh-my-zsh

if [ -f $ZSH/oh-my-zsh.sh ]; then
    #ZSH_THEME="gallois"
    #ZSH_THEME="prey"
    plugins=(git nmap pyenv tmux)

    source $ZSH/oh-my-zsh.sh
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
