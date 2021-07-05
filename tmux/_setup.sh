#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

echo 'Link tmux.conf'
pushd ~ > /dev/null
ln -fs $HERE/tmux.conf .tmux.conf
popd > /dev/null

echo 'Download tmux-resurrect plugin'
mkdir -p $HOME/bin
git clone https://github.com/tmux-plugins/tmux-resurrect $HOME/bin/tmux-resurrect
