# dotfiles

Just copy or skim at whatever files you need.

## Notes
I use [stow](https://www.gnu.org/software/stow/) to manage my dotfiles.

### Use case
Say I am on a new machine, and I want to grab my configurations for x related, vifm, vim, nvim, tmux.

I would run the following script.
```
# install.sh
stow -v -d . -t ~/ x
stow -v -d . -t ~/ vifm
stow -v -d . -t ~/ vim
stow -v -d . -t ~/ nvim
stow -v -d . -t ~/ tmux
```
