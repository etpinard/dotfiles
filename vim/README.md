# vim (and neovim)

## Dependencies installed on `./_setup.sh`

- vim-plug https://github.com/junegunn/vim-plug
- colorscheme _distinguished_ https://github.com/Lokaltog/vim-distinguished

and see `vimrc` for list of vim plugins used.

## A note on (neo)vim split / tmux-pane navigation

Currently `Alt-(hjkl)` is used to navigate between tmux panes AND neovim splits
as if they were all the same _thing_.

If using, vim (i.e. not neovim), `Alt-(hjkl)` does not (yet) work to navigate
between splits (as I can't get maps that involve `Alt` to work properly), so use
`` `-(hjkl)`` to navigate between vim splits and `Alt-(hjkl) to navigate between
tmux panes.
