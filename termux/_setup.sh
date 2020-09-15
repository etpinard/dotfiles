#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

cat /etc/hostname
if [ $? -eq 0 ]; then
    echo "Hmm. Does not seem to be running on termux?"
    echo "Skip."
    exit 0
fi

mkdir -p ~/.termux

echo 'Link termux.properties'
pushd ~/.termux > /dev/null
ln -fs $HERE/termux.properties termux.properties
popd > /dev/null
