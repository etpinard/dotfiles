#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

echo 'Setup vim/nvim directories'
mkdir -p ~/.vim/{colors,autoload}
mkdir -p ~/.config/nvim/colors
mkdir -p ~/.local/share/nvim/site/autoload

echo 'Link vimrc'
pushd ~ > /dev/null
ln -fs $HERE/vimrc .vimrc
popd > /dev/null

echo 'Link vimrc for neovim'
pushd ~/.config/nvim > /dev/null
ln -fs $HERE/vimrc init.vim
popd > /dev/null

echo 'Download and copy vim-plug in place'
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp -f plug.vim ~/.vim/autoload
cp -f plug.vim ~/.local/share/nvim/site/autoload
rm -f plug.vim

echo 'Download and copy distinguished color schemes in place'
wget https://raw.githubusercontent.com/Lokaltog/vim-distinguished/develop/colors/distinguished.vim
cp -f distinguished.vim ~/.vim/colors/distinguished.vim
cp -f distinguished.vim ~/.config/nvim/colors/distinguished.vim
rm -f distinguished.vim

echo 'Install plugins as listed in vimrc'
vim +PlugIntall +qall
nvim +PlugIntall +qall
