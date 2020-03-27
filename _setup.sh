#! /bin/bash

declare -a sub=("bin" "bash" "git" "vim" "tmux" "julia")

for i in "${sub[@]}"; do
    echo 'Setting up:' $i

    pushd $i > /dev/null
    chmod +x _setup.sh
    . _setup.sh
    popd > /dev/null

    echo ''
done
