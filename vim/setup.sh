#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

# setup directories
mkdir -p ~/.vim/{colors,autoload}
mkdir -p ~/.config/nvim/colors
mkdir -p ~/.local/share/nvim/site/autoload

# link vimrc
#pushd ~ && ln -fs $HERE/vimrc .vimrc && popd
pushd ~/.config/nvim && ln -fs $HERE/vimrc init.vim && popd

# download and copy vim-plug
# https://github.com/junegunn/vim-plug
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp -f plug.vim ~/.vim/autoload
cp -f plug.vim ~/.local/share/nvim/site/autoload
rm -f plug.vim

# download and copy colorschemes
wget https://raw.githubusercontent.com/Lokaltog/vim-distinguished/develop/colors/distinguished.vim
cp -f distinguished.vim ~/.vim/colors/distinguished.vim
cp -f distinguished.vim ~/.config/nvim/colors/distinguished.vim
rm -f distinguished.vim

# install plugins
vim +PlugIntall +qall
nvim +PlugIntall +qall
