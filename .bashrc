# set -x
# git config --global --add url."git@github.com:".insteadOf "https://github.com/"

alias greset="git reset --hard @{u}"

function prune {
     git prune
     git gc
}
function killdockers {
    docker kill $(docker ps -q)
    docker rm $(docker ps -a -q)
}

function clone_internal { 
  git clone https://username:${GH_GH_PAT}@github.com/$1/$2 /workspaces/$2
}

export PATH=~/go/bin:$PATH 

function go_env {
  go env -w GOPRIVATE='*github.com/github/*'
}

go_env

git config pull.rebase true 
