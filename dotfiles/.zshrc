# Load dotfiles:
for file in ~/.setup/dotfiles/.{aliases,zshrc_profile}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# ---- Zoxide (better cd) ----
# eval "$(zoxide init zsh)"

# ---- HomeBrew PATH ----
# export PATH="/opt/homebrew/bin:$PATH"

