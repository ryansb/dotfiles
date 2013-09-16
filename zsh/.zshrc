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

#if (( $+commands[gvim] )) ; then
#    alias vim="gvim -v"
#fi

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

### aliases
# git
alias gap="git add -p"
alias gst="git status -s"
alias gps="git push --set-upstream"
alias gsss="echo \`gs -s|grep M|wc -l\`M,\`gs -s|grep D|wc -l\`D,\`gs -s|grep ??|wc -l\`?"
alias yolo="git commit -a -m 'deal with it.'; git push --force"
alias gcheat="echo 'Git
Branch (b)
Commit (c)
Conflict (C)
Data (d)
Fetch (f)
Grep (g)
Index (i)
Log (l)
Merge (m)
Push (p)
Rebase (r)
Remote (R)
Stash (s)
Submodule (S)
Working Copy (w)'"
alias gfull="less ~/.dotfiles/zsh/.zprezto/modules/git/alias.zsh"

# systems stuff
alias llog="sudo tail -f /var/log/messages -n46" # colorized live log
alias lsec2="list_instances -H ID,Zone,T:Name,Key,Hostname,State"
alias rsync="noglob rsync -hv --progress"
alias fuck="pkill -9 -f"
alias jq="/usr/local/bin/jq -C"
alias jqn="/usr/local/bin/jq"

alias shuffledir="mplayer -playlist <(find \$PWD -type f|sort -R)"
alias musicfind="grep -R --include=\"*.txt\" "
alias dupfind="find -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 33 | cut -c 35-"
