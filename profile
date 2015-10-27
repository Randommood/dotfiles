#!/usr/bin/env sh

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

## set PATH so it includes user's private bin if it exists
if [[ -d "$HOME/bin" ]] ; then
    PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.files/bin" ]] ; then
    PATH="$HOME/.files/bin:$PATH"
fi

export PATH="$HOME/sbin:/usr/local/bin:$PATH:/usr/local/git/bin:/usr/local/sbin"

## Editor
if [[ -s $(which mvim) ]]; then
  export EDITOR=mvim
else
  export EDITOR=vim
fi

export HISTFILESIZE=9999
export HISTSIZE=9999

source "$HOME/.alias"
eval "$(chef shell-init bash)"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/inessombra/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/inessombra/google-cloud-sdk/completion.bash.inc'
