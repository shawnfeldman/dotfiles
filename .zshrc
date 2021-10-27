# set -x
ZSH_THEME="robbyrussell"
# git config --global --add url."git@github.com:".insteadOf "https://github.com/"

alias greset="git reset --hard @{u}"

function ngrok_run {
     ngrok http -region=us -hostname=shawnfeldman.ngrok.io 8000
}
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

function get_ngrok {
  wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
  unzip ngrok-stable-linux-amd64.zip -d 
}

export PATH=~/go/bin:$PATH 

function go_env {
  go env -w GOPRIVATE='*github.com/github/*'
}

go_env