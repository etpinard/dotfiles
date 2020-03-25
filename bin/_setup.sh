#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

mkdir -p ~/bin

for f in $(ls $HERE); do
    if [ $f == '_setup.sh' ] || [ $f == 'README.md' ]; then
        continue
    fi

    echo 'chmod +x' $f
    chmod +x $HERE/$f

    echo 'Link' $f 'in ~/bin'
    pushd ~/bin > /dev/null
    ln -fs $HERE/$f $f
    popd > /dev/null
done
