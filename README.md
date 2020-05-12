Installation
============

1. `git clone --no-checkout https://github.com/andybryson/dotfiles.git .dotfiles`
2. `cd .dotfiles`
3. `git config core.worktree "$HOME"`
4. `git config core.sparseCheckout true`
5. `printf '/*\n!README.md' | git sparse-checkout set --stdin`
6. `git checkout master`


Also
`sudo apt-get install zsh tmux tmuxinator`
