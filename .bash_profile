alias ls="ls -G"

export PATH=$HOME/scripts:/usr/local/go/bin:$PATH
alias gitst="git status -s -b 2>/dev/null"
if [ $TERM_PROGRAM = Apple_Terminal ]; then
  heart_prompt() {
    if [ $? == 0 ]; then
      PS1="\[\033[1;34m\]\h : \w\[\033[0m\] \$(git -c color.ui=always branch 2> /dev/null)\n💗  "
    else
      PS1="\[\033[1;34m\]\h : \w\[\033[0m\] \$(git -c color.ui=always branch 2> /dev/null)\n💔  "
    fi
  }
  PROMPT_COMMAND=heart_prompt
fi

# The next line updates PATH for the Google Cloud SDK.
source '/Users/ashi/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/ashi/google-cloud-sdk/completion.bash.inc'
