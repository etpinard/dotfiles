#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

echo 'Link profile, bashrc and bash_aliases'
pushd ~ > /dev/null
ln -fs $HERE/profile .profile
ln -fs $HERE/bashrc .bashrc
ln -fs $HERE/bash_aliases .bash_aliases
popd > /dev/null

mkdir -p ~/bin

# https://github.com/rupa/z
echo 'Download rupa/z (jump around) to ~/bin'
wget https://raw.githubusercontent.com/rupa/z/master/z.sh
chmod +x z.sh
mv -f z.sh ~/bin

# https://github.com/magicmonty/bash-git-prompt
echo 'Download bash-git-prompt to ~/bin'
git clone https://github.com/magicmonty/bash-git-prompt.git ~/bin/bash-git-prompt --depth=1

# need to do this in all open windows
echo 'Source bash rc files'
source ~/.profile
source ~/.bashrc
