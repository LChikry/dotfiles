###############################################################################
#                                       GIT                                   #
###############################################################################
alias ga='git add'
alias gaa='ga -A'
alias gc='git commit -m'
alias gaac='gaa && gc'
gac() {
		local message="$1"
		shift
		ga "$@" && gc "$message"
}
alias gca='git commit --amend --no-edit'
alias gcam='git commit --amend -m'
alias gaaca='gaa && gca'
alias gaacam='gaa && gcam'
gaca() {
		ga "$@" && gca
}
gacam() {
		local message="$1"
		shift
		ga "$@" && gcam "$message"
}

alias gs='git status'
alias gf='git fetch'
alias gpf='git pull --ff-only'
alias gpr='git pull --rebase'
alias gp='git push'

alias ggr="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --since='2 weeks ago' --all"
alias ggo="git log --graph --abbrev-commit --decorate --date=short --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ad)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --until='2 weeks ago' --all"
alias gg='ggr && ggo'


alias gdws='git diff'
alias gdsws='gdws --staged'

alias gsd='gdws --stat'
alias gsds='gsd --staged'

alias gd='git diff -w'
alias gds='gd --staged'
alias gdw='gdws --word-diff'
alias gdsw='gdw --staged'
alias gdf='gd --no-index'

# - git swh = git show -w HEAD
# alias gw='git switch'
# alias gwm='gw main'
# alias gwd='gw dev'
# - git fop = git fetch origin --prune
# - git mofo = git merge origin/master --ff-only
# - git forgot = git edit --no-edit
# alias gco='git checkout'
# alias gb='git branch'
# alias gba='git branch --all'
# alias gbd='git branch -D'
# alias gcp='git cherry-pick'
# alias grs='git restore --staged'
# alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || exa'
# alias gu='git reset --soft HEAD~1'
# alias gpr='git remote prune origin'
# alias ff='gpr && git pull --ff-only'
# alias grd='git fetch origin && git rebase origin/master'
# alias gbb='git-switchbranch'



###############################################################################
#                             Navigation & Search                             #
###############################################################################
# fs() {
#     aerospace list-windows --all | \
#     fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
# }

alias cd='z'
alias cdr="cd -"            # Go return to prev visited dir
alias cdh='cd ${HOME}/LC'
alias cdp='cd ${HOME}/LC/2_Coding'
alias cds='cd ${HOME}/LC/4_AUI_University/7_Summer25'
alias cddw='cd ${HOME}/Downloads'
alias cddk='cd ${HOME}/Desktop' 
alias cddc='cd ${HOME}/Documents'
alias cdfh='open ${HOME}/LC'
alias cdfp='open ${HOME}/LC/2_Coding'
alias cdfs='open ${HOME}/LC/4_AUI_University/7_Fall25'
alias cdfdw='open ${HOME}/Downloads'
alias cdfds='open ${HOME}/Desktop' 
alias cdfdc='open ${HOME}/Documents'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias ls="eza -l --color=always --icons=always --git --grid --width=80 --no-filesize --no-permissions --no-time --no-user"
alias lt="ls --tree --level=2"
alias ll="eza -l --color=always --icons=always --git --width=80 --no-filesize --no-user"
alias lsa="ls -a"
alias lta="lt -a"



###############################################################################
#                              Editors & Languages                            #
###############################################################################
alias q='exit'
alias c='clear'
alias clr='clear'
alias cat='bat'
alias vim='nvim'
alias vi='nvim'
alias python='python3'
alias py='python3'
alias pip='pip3'



###############################################################################
#                                    Packages                                 #
###############################################################################
alias bi="brew install"
alias bu="brew uninstall"
alias bup='brew update; brew upgrade; brew upgrade --cask; brew cleanup'
alias bs="brew search"
alias bl="brew list"
alias bh="brew info"
alias pn='pnpm'