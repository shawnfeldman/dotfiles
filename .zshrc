ZSH_THEME="robbyrussell"
source ./oh-my-zsh.sh
go env -w GOPRIVATE='*github.com/github/*'
git config --global --add url."git@github.com:".insteadOf "https://github.com/"


alias greset="git reset --hard @{u}"
alias dbprepare="./bin/rake db:migrate db:test:prepare"
function gh-setup {
    printf "\\n:construction:  Jumping to GitHub  :construction:\\n"
    echo   "====================================================="
    cd "~/github/github" || exit 1
    printf "\\n:construction:  Gitting up to date...  :construction:\\n"
    echo   "====================================================="
    git pull --rebase origin master
    printf "\\n:construction:  Bootstrapping...  :construction:\\n"
    echo   "====================================================="
    ./script/bootstrap
    printf "\\n:construction:  Migratng the database(s)  :construction:\\n"
    echo   "====================================================="
    dbprepare
}

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


