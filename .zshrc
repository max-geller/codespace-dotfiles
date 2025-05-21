# Setup TERM for 256 color support
export TERM="xterm-256color"


# plugins=(git zsh-autosuggestions zsh-syntax-highlighting zoxide)

# Load Zsh Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# History Setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# Eza Alias
alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions"

# Zoxide Setup
alias cd="z"
eval "$(zoxide init zsh)"
