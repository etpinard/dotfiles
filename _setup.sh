#! /bin/bash

EXIT_CODE=0

# all the submodules
declare -a ALL=("bin" "bash" "ssh" "git" "vim" "tmux" "julia" "gnome" "termux", "alacritty")
# the submodules that should 'always' get installed
declare -a ALWAYS=("bin" "bash" "ssh" "git" "vim" "tmux")

_main () {
    for i in "$@"; do
        if [[ " ${ALL[@]} " =~ " ${i} " ]]; then
            echo 'Setting up:' $i

            pushd $i > /dev/null
            chmod +x _setup.sh
            . _setup.sh
            popd > /dev/null

            echo ''
        else
            echo '[ERR] unrecognized submodules ' $i
            EXIT_CODE=1
        fi
    done
}

_usage () {
cat << EOF
    Usage: @etpinard/dotfiles/_setup.sh

    Setup (mostly "ln -s") personal dotfiles !

    # minimal setup 'required' for every machine I used
    - ./_setup.sh

    # target specic application (e.g. julia)
    - ./_setup.sh julia

    # all the submodules
    - ./_setup.sh ALL

EOF
}

case $1 in
    --help | -h)
        _usage
        exit 0
        ;;
    ALL | all)
        _main ${ALL[@]}
        ;;
    *)
        if [ $# -eq 0 ]; then
            _main ${ALWAYS[@]}
        else
            _main $@
        fi
        ;;
esac

exit $EXIT_CODE
