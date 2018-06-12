#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

# link profile, bashrc and bash_aliases
pushd ~
ln -fs $HERE/profile .profile
ln -fs $HERE/bashrc .bashrc
ln -fs $HERE/bash_aliases .bash_aliases
popd
