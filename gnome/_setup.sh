#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

echo 'dconf load .conf files'
cat $HERE/*.conf | dconf load /
