unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

autoload -U colors && colors

plugins=(git history)

HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.zsh_history"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# git branch info in prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*' formats "[%b]"
precmd() {
    vcs_info
}
setopt prompt_subst

# terraform aliases
alias tf='terraform'
alias tfi='terraform init'
alias tfa='terraform apply'
alias tfaa='terraform apply --auto-approve'
alias tfd='terraform destroy'
alias tfda='terraform destroy --auto-approve'
alias tfp='terraform plan'
alias tfsl='terraform state list'
alias tff='terraform fmt'

export TERM="xterm-256color"
# git aliases
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# plugins
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

prompt='%F{255}%F %F{78}%3~%F %F{yellow}${vcs_info_msg_0_}%F> '

# note: use symlinks
# ln -sv ~/Projects/dotfiles/.vimrc ~
# ln -sv ~/Projects/dotfiles/.zshrc ~

export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv init --path)"
fi
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kangwei/google-cloud-sdk/completion.zsh.inc' ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kangwei/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

. "$HOME/.local/bin/env"
