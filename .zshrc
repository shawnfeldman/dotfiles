ZSH_THEME="robbyrussell"

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

function prune {
     git prune
     git gc
}
function killdockers {
    docker kill $(docker ps -q)
    docker rm $(docker ps -a -q)
}