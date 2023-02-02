# My dotfiles

My settings file, I try to bind vim keys every where I can.

## Installation

First clone the repository to ~/.dotfiles :
```bash
git clone --bare git@github.com:fabienengels/dotfiles.git ~/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
```

Relaunch fish, a ```dotfiles``` alias should be available. It set ~/.dotfiles as git dir and ~ as work tree.
You can hide untracked files by executing the following command :
```bash
dotfiles config --local status.showUntrackedFiles no
dotfiles status # Only tracked files should be showned
```
