#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

mkdir -p $HOME/.ssh

echo 'Link .ssh/rc'
pushd $HOME/.ssh > /dev/null
ln -fs $HERE/rc rc
popd > /dev/null
