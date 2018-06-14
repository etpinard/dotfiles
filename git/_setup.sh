#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

echo 'Link gitconfig'
pushd ~ > /dev/null
ln -fs $HERE/gitconfig .gitconfig
popd > /dev/null
