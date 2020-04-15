Installation
============

1. `git clone --no-checkout https://github.com/andybryson/dotfiles.git dotFiles`
2. `cd dotFiles`
3. `git config core.worktree "$HOME"`
4. `git config core.sparseCheckout true`
5. `printf '/*\n!readme.md' | git sparse-checkout set --stdin`
6. `git checkout master`
7. `echo "gitdir: ~/dotfiles/.git" > ~/.git`
8. `git submodule update`
9. `vim +PluginInstall +qall`
