#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")
DIR=$HOME/.config/alacritty

echo 'Link alacritty.yml'
mkdir -p $DIR
pushd $DIR > /dev/null
ln -fs $HERE/alacritty.yml alacritty.yml
popd > /dev/null
