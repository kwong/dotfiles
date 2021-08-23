unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

autoload -U colors && colors

plugins=(git history zsh-autosuggestions)

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
alias tfa='terraform apply'
alias tfaa='terraform apply --auto-approve'
alias tfd='terraform destroy'
alias tfda='terraform destroy --auto-approve'
alias tfp='terraform plan'
alias tfsl='terraform state list'

export TERM="xterm-256color"
# git aliases
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


prompt='%F{255}%F %F{78}%3~%F %F{yellow}${vcs_info_msg_0_}%F> '
