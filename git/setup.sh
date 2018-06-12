#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

# link gitconfig
pushd ~
ln -fs $HERE/gitconfig .gitconfig
popd
