# ---------------------------------------------------------------------------
# Environment & PATH
# ---------------------------------------------------------------------------
typeset -U path PATH   # keep PATH entries unique

unset LSCOLORS
export CLICOLOR=1

export GOPATH="$HOME/go"
path+=("$GOPATH/bin")

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

[[ -f "$HOME/.local/bin/env" ]] && . "$HOME/.local/bin/env"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kangwei/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/kangwei/.lmstudio/bin"
# End of LM Studio CLI section

# Added by Antigravity
export PATH="/Users/kangwei/.antigravity/antigravity/bin:$PATH"

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt share_history hist_ignore_all_dups hist_ignore_space extended_history

# ---------------------------------------------------------------------------
# Options
# ---------------------------------------------------------------------------
setopt autocd

# ---------------------------------------------------------------------------
# Completion
# ---------------------------------------------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' accept-exact '*(N)'
_comp_options+=(globdots)

gcloud_sdk="$HOME/Downloads/google-cloud-sdk"
[[ -f "$gcloud_sdk/path.zsh.inc" ]] && . "$gcloud_sdk/path.zsh.inc"
[[ -f "$gcloud_sdk/completion.zsh.inc" ]] && . "$gcloud_sdk/completion.zsh.inc"
unset gcloud_sdk

# ---------------------------------------------------------------------------
# Prompt (git branch via vcs_info)
# ---------------------------------------------------------------------------
autoload -Uz vcs_info add-zsh-hook
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "[%b]"
add-zsh-hook precmd vcs_info
setopt prompt_subst

PROMPT=' %F{156}%3~%f %F{120}${vcs_info_msg_0_}%f '
RPROMPT='%F{157}%T%f'
# eval "$(starship init zsh)"

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# files
alias ll='ls -lah'
alias la='ls -A'
alias lt='ls -laht'

# safety nets (prompt before overwrite/delete)
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfa='terraform apply'
alias tfaa='terraform apply --auto-approve'
alias tfd='terraform destroy'
alias tfda='terraform destroy --auto-approve'
alias tfp='terraform plan'
alias tfsl='terraform state list'
alias tff='terraform fmt'

# git
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# ---------------------------------------------------------------------------
# Plugins (keep last; syntax-highlighting must be sourced at the very end)
# ---------------------------------------------------------------------------
zsh_plugins="$HOME/.zsh/plugins"
# [[ -f "$zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && . "$zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# [[ -f "$zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && . "$zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
unset zsh_plugins
