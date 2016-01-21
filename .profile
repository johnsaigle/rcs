#Prompt config
PS1='\[\e[00m\]\342\234\223 \[\e[01;32m\]\u@\h \[\e[01;34m\]\w \n[\t] $ '
PS2='> '
PS4='+ '

# Nice LS colours. Customized to look good with Solarized theme
CLICOLOR=1
LSCOLORS=ExfxbEaEBxxEhEhBaDaCaD

# Aliases to make life easier
alias down='cs ~/Downloads'
alias hack='cs ~/Documents/workspace'
alias ls='ls -lFG'
alias epro='vim ~/.profile'
alias rfp='source ~/.profile'
alias work='ssh lorisadmin@132.206.37.47'
alias ip='ipconfig getifaddr en0'

#Initialize PATH
PATH=/usr/local/bin/:/opt/ff-kit/Scripts:/Users/john/.venvburrito/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/ImageMagick/bin:/usr/local/mysql/bin

# Handy function to combine cd and ls into one command.
# Works with aliases, so will print nice ls outputs
cs () {
    cd "$1" && ls
}
