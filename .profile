alias down='cs ~/Downloads'
alias geo='cs ~/Documents/workspace/geo'
alias gogo_cms='cs /Applications/MAMP/htdocs/order-app'
alias hack='cs ~/Documents/workspace'
alias ls='ls -GFhl'
alias epro='vim ~/.profile'
alias rfp='source ~/.profile'
CLICOLOR=1
GREP_OPTIONS=--color=auto
PS1='\[\e[00m\]\342\234\223 \[\e[01;32m\]\u@\h \[\e[01;34m\]\w \n[\t] $ '
PS2='> '
PS4='+ '
cs () {
    cd "$1" && ls
}
