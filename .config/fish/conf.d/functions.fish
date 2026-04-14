function man
    /usr/bin/man $argv | bat -l man -p
end

function pr-delete
    set worktree "../$(path basename (pwd))-pr$argv"
    if test -d $worktree
        git worktree remove $worktree
    end
    git branch -D pr-$argv
end

function pr-worktree
    git fetch -v origin pull/$argv/head:pr-$argv
    set worktree "../$(path basename (pwd))-pr$argv"
    if test ! -d $worktree
        git worktree add $worktree pr-$argv
    else
        echo "Worktree $worktree already exists"
    end
end
