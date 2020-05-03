#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

setup_dconf () {
    echo 'dconf load .conf files'
    cat $HERE/*.conf | dconf load /
}

# Inspired by:
# https://linuxconfig.org/how-to-install-gnome-shell-extensions-from-zip-file-using-command-line-on-ubuntu-18-04-bionic-beaver-linux
#
# EXPERIMENTAL
# In theory, would have to install extensions for specific gnome version
# as given by `gnome-shell --version`

# - https://extensions.gnome.org/extension/484/workspace-grid/
# - https://extensions.gnome.org/extension/779/clipboard-indicator/
# - https://extensions.gnome.org/extension/905/refresh-wifi-connections/

exts=(
    'https://github.com/zakkak/workspace-grid/releases/download/workspace-grid-for-3.30-b46/workspace-grid.mathematical.coffee.gmail.com.zip'
    'https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator/archive/v30.zip'
    'https://github.com/kgshank/gse-refresh-wifi/archive/3.30.0.10.zip'
)

dw=$HOME/bin/gnome-extensions
share=$HOME/.local/share/gnome-shell/extensions

setup_extensions () {
    mkdir -p $dw

    pushd $dw > /dev/null
    for i in ${exts[@]}; do
        name=$(basename $i)
        wget $i -nv -O $name
        metapath=$(unzip -l $name | grep metadata.json | grep -o '[^ ]*$')
        dirname=$(dirname $metapath)
        uuid=$(unzip -c $name $metapath| grep uuid | cut -d \" -f4)
        folder=$share/$uuid/
        unzip -q $name -d $uuid
        mkdir -p $folder
        echo $dirname
        echo $uuid
        cp -rf $uuid/$dirname/* $folder
        gnome-shell-extension-tool -e $uuid
        echo ''
    done
    popd > /dev/null

    echo 'Please log out and log back to see the changes'
}

clear_extensions () {
    rm -rf $dw/*

    pushd $share > /dev/null
    for uuid in `ls`; do
        gnome-shell-extension-tool -d $uuid
    done
    popd > /dev/null
    rm -rf $share/*
}

case $1 in
    extensions)
        clear_extensions
        setup_extensions
        ;;
    *)
        setup_dconf
        ;;
esac
