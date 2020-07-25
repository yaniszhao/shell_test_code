alias ls='ls -G'
alias ll='ls -l'

alias hind_desk="defaults write com.apple.finder CreateDesktop -bool FALSE;killall Finder"
alias show_desk="defaults delete com.apple.finder CreateDesktop;killall Finder"

# Tell ls to be colourful
export CLICOLOR=1
#export LSCOLORS=Exfxcxdxbxegedabagacad
export LSCOLORS=gxfxaxdxcxegedabagacad

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

#export TERM="xterm-color"
#PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
#export PS1='\033[01;33m\][\u@\h ]\033[01;34m\]\W \[\033[01;36m\]\$\[\033[00m\] '
PS1='\[\e[1;31m\][\u@\h \W]\$\[\e[0m\] '
