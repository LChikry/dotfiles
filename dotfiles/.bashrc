# Load dotfiles:
for file in ~/.dotfiles/dotfiles/.{shared_shell,bash_profile}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Zoxide (better cd)
eval "$(zoxide init bash)"