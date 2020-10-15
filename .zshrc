#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
#    if [[ -z "$ID" ]] ;then # if not available create a new one
#        exec tmux
#    else
#       exec tmux attach-session -t "$ID" # if available attach to it
#    fi 
#    exit 0
#fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.config/oh-my-zsh

#export ZSH_TMUX_AUTOSTART=true
ZSH_DISABLE_COMPFIX="true"
unsetopt correct_all
unsetopt correct
DISABLE_CORRECTION="true"

DISABLE_AUTO_UPDATE="true"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"  #"clean-ab" #robbyrussell"

export EDITOR=vim

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias mux="tmuxinator"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git cp common-aliases tmux sudo tmuxinator)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
if [ "$(uname -o)" = "Cygwin" ]; then
    PATH=/cygdrive/d/software/Python27:$PATH
    export PATH
    export CYGWIN="${CYGWIN} nodosfilewarning"
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
   if [[ -a /etc/profile.d/vte.sh ]]; then
       source /etc/profile.d/vte.sh
   else
       source /etc/profile.d/vte-2.91.sh
   fi
fi

PATH=$PATH:/usr/lib/x86_64-linux-gnu
export PATH

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}


bindkey -s '^O' 'ranger-cd\n'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias rb1="ssh ineos@rb1"
alias rb2="ssh ineos@rb2"
alias chase4="ssh ineos@c4"
alias wheelyda="ssh ineos@wheelyda"
alias bar-da1="ssh andy@192.168.64.96"
alias server1="ssh ineos@server1"
alias server2="ssh ineos@server2"
alias fakemedia="ssh -t ineos@rb2 ssh 10.0.50.1"

alias config='/usr/bin/git --git-dir=$HOME/src/dotFiles --work-tree=$HOME'

#LD_LIBRARY_PATH="/opt/anaconda3/lib/"
#export LD_LIBRARY_PATH='/opt/anaconda3/lib/':$LD_LIBRARY_PATH
