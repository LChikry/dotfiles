# Load dotfiles:
for file in ~/.dotfiles/dotfiles/.{shared_shell,zshrc_profile}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Zoxide (better cd)
eval "$(zoxide init zsh)"

export PATH="/opt/homebrew/anaconda3/bin:$PATH"

source /opt/homebrew/anaconda3/etc/profile.d/conda.sh

