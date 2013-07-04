#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export ZDOTDIR="$HOME/.dotfiles/zsh"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

### functions
# credit to grml for this function
# Check if we can read given files and source those we can.
xsource() {
    if (( ${#argv} < 1 )) ; then
        printf 'usage: xsource FILE(s)...\n' >&2
        return 1
    fi

    while (( ${#argv} > 0 )) ; do
        [[ -r "$1" ]] && source "$1"
        shift
    done
    return 0
}

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

# use vim keys
#bindkey -v
#
## use vim or vi
#if (( $+commands[vim] )) ; then
#    export EDITOR=vim
#else
#    export EDITOR=vi
#fi
#
#if (( $+commands[gvim] )) ; then
#    alias vim="gvim -v"
#fi


# support colors in less
#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;31m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;44;33m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;32m'
export LESS="-F -X -i -M -R -S -w -z-4 -a"

# report about cpu-/system-/user-time of command if running longer than 5 seconds
REPORTTIME=5

### functions
# simple webserver
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}


### Python Environments
xsource /usr/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUAL_ENV_DISABLE_PROMPT=1
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'

export AWS_CREDENTIAL_FILE="/etc/boto.aws.cfg"

export GOROOT="$HOME/.golang"
export PATH="$PATH:$GOROOT/bin"

### aliases
# git
alias g="git"
alias gap="git add -p"
alias gps="git push"
alias gpa="git pull --all"
alias gs="git status -s"
alias glh="git ls | head"
alias gsn="git status -s --untracked=no"
alias gsss="echo \`gs -s|grep M|wc -l\`M,\`gs -s|grep D|wc -l\`D,\`gs -s|grep ??|wc -l\`?"
alias gd="git diff"
alias gdc="git diff --cached HEAD^"
alias gss="git stash show"
alias gsp="git stash pop"
alias gst="git stash"
alias gsl="git stash list"
alias gsd="git stash drop"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias gr="git rebase"
alias yolo="git commit -a -m 'deal with it.'; git push --force"

# systems stuff
# colorized live log
alias llog="sudo tail -f /var/log/messages -n46"
alias lsec2="list_instances -H ID,Zone,T:name,Key,Hostname,State"
alias rsync="noglob rsync -hv --progress"
alias fuck="pkill -9 -f"

alias shuffledir="mplayer -playlist <(find \$PWD -type f|sort -R)"
alias musicfind="grep -R --include=\"*.txt\" "
