alias ls="ls -G"

export PATH=$HOME/scripts:/usr/local/go/bin:$PATH
alias gitst="git status -s -b 2>/dev/null"
if [ $TERM_PROGRAM = Apple_Terminal ]; then
	PS1="\[\033[1;34m\]\h : \w\[\033[0m\] \$(git -c color.ui=always branch 2> /dev/null)\n💗  "
fi
