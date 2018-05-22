alias ls="ls -G"
alias git=hub
alias nodesk="defaults write com.apple.finder CreateDesktop false && killall Finder"
alias deskme="defaults write com.apple.finder CreateDesktop true && killall Finder"
nodesk
alias plan="open -a Emacs PLAN"

export EDITOR=emacs
export PATH=$HOME/scripts:/usr/local/go/bin:$PATH
alias gitst="git status -s -b 2>/dev/null"
if [ "$TERM_PROGRAM" = Hyper ] ||
   [ "$TERM_PROGRAM" = Apple_Terminal ] ||
   [ "$TERM_PROGRAM" = iTerm.app ] ||
   [ -n "$VSCODE_PID" ]; then

  setBackgroundColor() {
      #printf '\x1bPtmux;\x1b\x1b[48;2;%s;%s;%sm' $1 $2 $3
      printf '\x1b[48;2;%s;%s;%sm' $1 $2 $3
  }

  resetOutput() {
      echo -en "\x1b[0m\n"
  }
  RESET='\033[0m'
  PURPLE='\033[1;35m'
  WHITE='\033[1;37m'

  hr() {
    printf $hr
  }

  heart_prompt() {
    if [ $? == 0 ]; then
      heart=" 💗  "
    else
      heart=" 💔  "
    fi

    cols=$(tput cols)
    hr=$(printf '─%.0s' $(seq 1 $cols) | ~/scripts/node_modules/.bin/lolcatjs -f)
    echo $hr
    branches=$(git branch > /dev/null 2>&1)      
    if [ $? = 0 ]; then      
      git -c color.ui=always branch
    fi
    echo -n "$heart"
  }
  PROMPT_COMMAND=heart_prompt
  PS1="\[${PURPLE}\]\h : \w\[\033[0m\]\n\[\]"
  PS0="\$(hr)\[${RESET}\]\n"
fi

alias c="code --new-window"
alias e="open -a Emacs"
export VISUAL="code -w"

# Git completion
source ~/scripts/git-completion.bash

# sigh
alias be="bundle exec"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# go
PATH=~/go_appengine:$PATH
# added by Anaconda 2.3.0 installer
export PATH="/Users/ashi/anaconda/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f "~/.profile" ]; then source ~/.profile; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "~/google-cloud-sdk/path.bash.inc" ]; then source "/Users/ashi/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "~/google-cloud-sdk/completion.bash.inc" ]; then source "/Users/ashi/google-cloud-sdk/completion.bash.inc"; fi

# added by Anaconda2 installer
export PATH="~/anaconda2/bin:$PATH"

# npx auto-fallback is the best kind of dangerous
. <(npx --shell-auto-fallback bash)

