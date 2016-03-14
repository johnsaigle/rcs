#===========================#
# Detect platform
platform='unknown'
if [[ "$OSTYPE" == 'linux-gnu' ]]; then
    platform='linux-gnu'
elif [[ "$OSTYPE" == 'darwin'* ]]; then
    platform='osx'
fi

#===========================#
# Fun colors for ls
# using 'Solarized' theme
if [[ $platform == 'linux-gnu' ]]; then
    eval `dircolors ~/Other/dircolors-solarized/dircolors.ansi-universal`
elif [[ $platform == 'osx' ]]; then
    export LS_COLORS=gxfxbEaEBxxEhEhBaDaCaD
fi

#===========================#
# Functions

# combine ls and cd
cs () {
    cd "$1" && ls
}

#===========================#
# Prompt

# stolen from someone else
if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp
    gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
    if tput setaf 1 &> /dev/null; then
        tput sgr0
        if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
            BASE03=$(tput setaf 234)
            BASE02=$(tput setaf 235)
            BASE01=$(tput setaf 240)
            BASE00=$(tput setaf 241)
            BASE0=$(tput setaf 244)
            BASE1=$(tput setaf 245)
            BASE2=$(tput setaf 254)
            BASE3=$(tput setaf 230)
            YELLOW=$(tput setaf 136)
            ORANGE=$(tput setaf 166)
            RED=$(tput setaf 160)
            MAGENTA=$(tput setaf 125)
            VIOLET=$(tput setaf 61)
            BLUE=$(tput setaf 33)
            CYAN=$(tput setaf 37)
            GREEN=$(tput setaf 64)
        else
            BASE03=$(tput setaf 8)
            BASE02=$(tput setaf 0)
            BASE01=$(tput setaf 10)
            BASE00=$(tput setaf 11)
            BASE0=$(tput setaf 12)
            BASE1=$(tput setaf 14)
            BASE2=$(tput setaf 7)
            BASE3=$(tput setaf 15)
            YELLOW=$(tput setaf 3)
            ORANGE=$(tput setaf 9)
            RED=$(tput setaf 1)
            MAGENTA=$(tput setaf 5)
            VIOLET=$(tput setaf 13)
            BLUE=$(tput setaf 4)
            CYAN=$(tput setaf 6)
            GREEN=$(tput setaf 2)
        fi
        BOLD=$(tput bold)
        RESET=$(tput sgr0)
    else
        # Linux console colors. I don't have the energy
        # to figure out the Solarized values
        MAGENTA="\033[1;31m"
        ORANGE="\033[1;33m"
        GREEN="\033[1;32m"
        PURPLE="\033[1;35m"
        WHITE="\033[1;37m"
        BOLD=""
        RESET="\033[m"
    fi

    parse_git_dirty () {
        [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit
        (working directory clean)" ]] && echo "*"
    }
    parse_git_branch () {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/*\(.*\)/\1$(parse_git_dirty)/"
    }

    PS1="\[${BOLD}${ORANGE}\]\u \[$BASE0\]at \[$ORANGE\]\h \[$BASE0\]in \[$BLUE\]\w\[$BASE0\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on\")\[$YELLOW\]\$(parse_git_branch)\[$BASE0\]\n\[${GREEN}\]\t \$ \[$RESET\]"

#Old prompt...
#PS1='\[\e[00m\]\342\234\223 \[\e[01;32m\]\u@\h \[\e[01;34m\]\w \n[\t] $ '
PS2='> '
PS4='+ '

#===========================#
# Aliases

# for right now, linux
# means work vm and osx
# is my personal pc
if [[ $platform == 'linux-gnu' ]]; then
    alias ls='ls -lath --classify --color=auto'
    alias work='cs /var/www/loris'
elif [[ $platform == 'osx' ]]; then
    alias ls='ls -ltFGh'
    alias work='ssh lorisadmin@132.206.37.47'
    alias down='cs ~/Downloads'
    alias hack='cs ~/Documents/workspace'
    alias ip='ipconfig getifaddr en0'
fi

# platform-independent
# keep these at the bottom 
# for easy concatenation
alias epro='vim ~/.profile'
alias rfp='source ~/.profile'

# Setting PATH for Python 3.5
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH
