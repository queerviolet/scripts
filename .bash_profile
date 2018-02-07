alias ls="ls -G"
alias git=hub
alias nodesk="defaults write com.apple.finder CreateDesktop false && killall Finder"
alias deskme="defaults write com.apple.finder CreateDesktop true && killall Finder"
nodesk
alias plan="open -a Emacs PLAN"

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

export NVM_DIR="/Users/ashi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

source ~/.profile
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ashi/google-cloud-sdk/path.bash.inc' ]; then source '/Users/ashi/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ashi/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/ashi/google-cloud-sdk/completion.bash.inc'; fi

export COHORT=1709-GH-NY
export COHORT_SLACK=1709-gh-ny-jr
export SLACK_API_TOKEN=$(cat ~/.slack-api-token)export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# added by Anaconda2 installer
export PATH="/Users/ashi/anaconda2/bin:$PATH"

# npx auto-fallback is the best kind of dangerous
. <(npx --shell-auto-fallback bash)
