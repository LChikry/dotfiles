# Fixing the Starship Newline Problem
precmd() { precmd() { echo "" } }
alias clear="precmd() { precmd() { echo } } && clear"

# Function for source (no alias needed)
eval "$(starship init zsh)" # terminal prompt

# Load dotfiles
for file in ~/.dotfiles/dotfiles/.{aliases.sh,zshrc_profile}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

export PATH="/opt/homebrew/bin:$PATH" # HomeBrew PATH
source /opt/homebrew/anaconda3/etc/profile.d/conda.sh #anaconda
eval "$(zoxide init zsh)" # Zoxide (better cd)

# ZSH Commands for Extra Features
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '\t' end-of-line
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

