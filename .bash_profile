alias ls="ls -G"
alias git=hub

export EDITOR=emacs
export PATH=$HOME/scripts:/usr/local/go/bin:$PATH
alias gitst="git status -s -b 2>/dev/null"
if [ "$TERM_PROGRAM" = Apple_Terminal ] ||
   [ "$TERM_PROGRAM" = iTerm.app ] ||
   [ -n "$VSCODE_PID" ]; then
  heart_prompt() {
    if [ $? == 0 ]; then
      PS1="\[\033[1;34m\]\h : \w\[\033[0m\] \$(git -c color.ui=always branch 2> /dev/null)\n💗  "
    else
      PS1="\[\033[1;34m\]\h : \w\[\033[0m\] \$(git -c color.ui=always branch 2> /dev/null)\n💔  "
    fi
  }
  PROMPT_COMMAND=heart_prompt
fi

alias c="open -a 'Visual Studio Code'"

# The next line updates PATH for the Google Cloud SDK.
# source '/Users/ashi/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
# source '/Users/ashi/google-cloud-sdk/completion.bash.inc'

# oh god
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/

# Git completion
source ~/scripts/git-completion.bash

# sigh
alias be="bundle exec"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# go
PATH=~/go_appengine:$PATH
# added by Anaconda 2.3.0 installer
export PATH="/Users/ashi/anaconda/bin:$PATH"

export NVM_DIR="/Users/ashi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.profile