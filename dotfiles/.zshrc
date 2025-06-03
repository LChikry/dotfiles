# Load dotfiles:
for file in ~/.dotfiles/dotfiles/.{shared_shell,zshrc_profile}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Zoxide (better cd)
eval "$(zoxide init zsh)"

export PATH="/opt/homebrew/anaconda3/bin:$PATH"

source /opt/homebrew/anaconda3/etc/profile.d/conda.sh

# ZSH Command History
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