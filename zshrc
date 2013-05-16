# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/brokamoto/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

autoload -U colors && colors

# Ignore duplicates in history
setopt hist_ignore_all_dups

# ls aliasesp
if [ `uname` = "Darwin" ]; then
    alias ls='ls -Gl'
    alias ll='ls -Gl'
    alias lA='ls -Gla'
    alias lr='ls -RGlA'
else
    alias ls='ls --color -lA'
    alias ll=ls
    alias lA=ls
    alias lr='ls -R'
fi
# 
alias dirsz='du -c | grep total'

# git aliases
alias gc='git commit'
alias gl='git log'
alias gco='git checkout'
alias gcnb='git checkout -b'
alias gb='git branch'
alias gch='git commit -a'
alias gpom='git push origin master'
alias gp='git push'
alias gpo='git push origin'
alias gpcb='git push origin `(git branch | grep "*" | sed "s/* //")`'
alias gs='git status'

# c
alias grep='grep --color'
alias search=grep

# move to my developer directory
alias dev='echo "Moving to developer directory..."; cd ~/Developer'
# find by name in current directory
alias ff='find . -name'
# visudo, for your bash profile,
# and minus syntax checking :P
alias viprof='vim ~/.bash_profile'
# Take me home!
alias gohome='cd ~'

# MacPorts $PATH extension
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

if [ -z "$SSH_CLIENT" ]; then
    SSH=""
else
    IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
    SSH="(%{$fg[red]%}$IP$%{$reset_color%})"
fi

PS1_HOST_DIR_LINE="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[yellow]%}%m$SSH%{$reset_color%}:%{$fg[cyan]%}%d%{$reset_color%}]"
export PS1="$PS1_HOST_DIR_LINE
%{$fg[white]%}%T $%{$reset_color%} "
