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
alias cdh='cd ~/LC'
alias cdp='cd ~/LC/2_Areas/Programming_Projects'
alias cds='cd ~/LC/2_Areas/Academics/AUI\ University/6th\ Semester'
alias cddw="cd ~/Downloads" 
alias cddk="cd ~/Desktop"   
alias cddc="cd ~/Documents" 
alias cdfh='open ~/LC'
alias cdfp='open ~/LC/2_Areas/Programming_Projects'
alias cdfs='open ~/LC/2_Areas/Academics/AUI\ University/7th\ Summer'
alias cdfdw="open ~/Downloads" 
alias cdfds="open ~/Desktop"   
alias cdfdc="open ~/Documents"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias ls="eza --color=always --grid --width=80 --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias lt="ls --tree --level=2"
alias la="ls -a"



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