# prae's .bashrc file
#
# If not running interactively, don't do anything.
#
[[ $- != *i* ]] && return

### Environment variables
export EDITOR='vim'
export GREP_COLOR='01;38;5;157'
export HISTCONTROL=ignoreboth
export HISTFILESIZE=2000
export VIRTUAL_ENV_DISABLE_PROMPT=1
export LESS='-R'
export PAGER='less'
export VISUAL='vim'
export VIRTUALENV_DISTRIBUTE='yes'

### If virtualenvwrapper is installed, source it to load up its commands
if hash virtualenvwrapper.sh 2>&-; then
    source `which virtualenvwrapper.sh`
fi

### Here we over-ride some command commands to add in our default options
alias bc='bc -l'
alias cp='cp -i'
alias df='df -h'
if hash colordiff 2>&-; then
    alias diff='colordiff'
else
    alias diff='diff'
fi
alias du='du -ch'
alias grep='grep --color=auto'
alias ln='ln -i'
alias ls='ls --color=auto -hF'
alias mkdir='mkdir -pv'
alias mkv='mkvirtualenv --distribute'
alias more='less'
alias mv='mv -i'
alias nano='nano -w'
alias ping='ping -c 5'
alias rm='rm -I'
alias ..='cd ..'
alias b='cd -'
alias tmux='tmux -2'
alias tm='tmux'
alias ta='tm attach -t0'

### custom "function" commands
function rd () { ( rdesktop -g 1280x1024 $1 ) & }
function bbc () {
    command="ssh clash.nullis.net './get_iplayer/get_iplayer"
    if [ $# -lt 1 ]; then
        echo "Usage: bbc <chan> [high|high2|vhigh|vhigh2|...]"
        return 1
    fi

    # get channel
    if [ $1 -eq 1 ]; then
        command="${command} --stream 80002"
    elif [ $1 -eq 2 ]; then
        command="${command} --stream 80005"
    else
        command="${command} --stream $1"
    fi

    if [ -n "$2" ]; then
        command="${command} --modes flash${2}"
    fi

    command="${command}' | vlc -"

    ( eval $command )
}

### Some custom commands to do some stuff we like to do
alias hist='history |grep $1'
alias ll='ls -l'
alias la='ll -A'
alias lt='la -rt'
alias pg='ps -ef | grep $1'
alias down='cd /storage/Unsorted/'
alias nzb='down'
### misc stuff
eval $(dircolors -b)

### window resize - make sure things keep wrapping
shopt -s checkwinsize

### Bash auto complete
complete -cf sudo
complete -cf man

### Our bash prompt
myuser=`/usr/bin/whoami`
case "$myuser" in
praetorian|prae)
	PS1='[\t] ${VIRTUAL_ENV:+\033[38;5;87m(`basename ${VIRTUAL_ENV}`) }\[\033[01;32m\]@\h \[\033[00m\]\w \! \[\033[01;34m\]\$\[\033[00m\] '
	;;
root)
	PS1='[\t] \[\033[38;5;196m\]@\h \[\033[00m\]\w \! \[\033[01;34m\]\$\[\033[00m\] '
	;;
*)
	PS1='[\t] \[\033[38;5;226m\]\u@\h \[\033[00m\]\w \! \[\033[01;34m\]\$\[\033[00m\] '
	;;
esac

