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


alias python=/usr/local/bin/python3.9
alias python=/usr/local/bin/pip3
alias python=/usr/local/bin/python3.9
alias pip=/usr/local/bin/pip3
alias pip=/usr/local/bin/pip3.9

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
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

prompt='%F{255}%F %F{78}%3~%F %F{yellow}${vcs_info_msg_0_}%F> '

# note: use symlinks
# ln -sv ~/Projects/dotfiles/.vimrc ~
# ln -sv ~/Projects/dotfiles/.zshrc ~

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kwong/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kwong/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kwong/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kwong/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
# export PATH="/usr/local/opt/terraform@0.12/bin:$PATH"
export PATH="/usr/local/opt/terraform@0.13/bin:$PATH"
