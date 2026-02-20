# easy tail
alias tailf='tail -f'

# Easy tmux
alias tmux='tmux -2'

# Bat
alias cat="bat"

# git alias
alias g="git"
alias gst="git status"
alias glog="git log --graph --pretty=format:'%Cred%h %Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gac="git add -A && git ci -m "
alias gci="git ci -m"
alias gall="git add -A"
alias ga="git add"
alias gpu="git push"
alias gpl="git pull"
alias gru="grep -nri --color"
alias gpr="hub pull-request -b "
alias gbr="git branch"
alias gtag="git tag -a"
alias gpom="git pull origin master"
alias gpmas="git checkout master && git pull origin master"
alias gpmain="git checkout main && git pull origin main"
alias gnbr="git checkout main && git pull origin main && g co -b"
alias gmainfco="git checkout main && git pull origin main && g fetch origin && g co"

function gfeat() {
  echo "git co -b feat/$1";
  git co -b feat/$1;
}

function gfix() {
  echo "git co -b fix/$1";
  git co -b fix/$1;
}

function grfo() {
  echo "git co -b refactor/$1";
  git co -b refactor/$1;
}

function gcho() {
  echo "git co -b chore/$1";
  git co -b chore/$1;
}

function gfetch() {
  git co $1
  git pull origin $1
  git fetch origin $2
  git co $2
}

# ls
alias ls="ls --color"
alias ll="ls -la --color"

# Clip
alias clip="xclip -sel clip"

# Grep
alias grep="grep --color"

# Shortcuts like vim ones
alias :q="exit"
alias :r="source ~/.zshrc"
alias :e="nvim"

# Tree
alias tree="tree -C -L 5 -I 'node_modules|vendor|bin'"

# Docker alias
alias drun="docker run -it --rm"
alias drm="docker rm"
alias drmi="docker rmi"
alias dc="docker-compose"
alias dce="docker-compose exec"
alias dcps="docker-compose ps"
alias dcb="docker-compose build"
alias dex="docker exec -it"
alias dcr="docker-compose restart"
alias drun="docker-compose run"
alias dps="docker ps"
alias dim="docker images"
alias dcup="docker-compose up"
alias dcl="docker-compose logs --tail=10 -f"

# Vim alias
alias vim=nvim
alias vi=nvim

# MacOS simulator aliases
alias simlist="xcrun simctl list devices"
