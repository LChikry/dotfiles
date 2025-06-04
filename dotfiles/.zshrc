
# Fixing the added new line at terminal launch
PROMPT_NEEDS_NEWLINE=false
precmd() {
    if [[ "$PROMPT_NEEDS_NEWLINE" == true ]]; then
        echo
    fi
    PROMPT_NEEDS_NEWLINE=true
}
clear() {
    PROMPT_NEEDS_NEWLINE=false
    command clear
}

eval "$(starship init zsh)" # terminal prompt
#emit 1st empty line by starship
# precmd() {
#     last_command=$(history | tail -n2 | head -n1 | sed 's/^[ ]*[0-9]*[ ]*//')
#     if [ "$last_command" = "clear" ] || [ "$last_command" = "c" ] || [ "$last_command" = "clr" ]; then
#         return
#     fi

#     precmd() {
#         echo
#     }
# }

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