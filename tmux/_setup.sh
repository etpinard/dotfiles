#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

echo 'Link tmux.conf'
pushd ~ > /dev/null
ln -fs $HERE/tmux.conf .tmux.conf
popd > /dev/null
