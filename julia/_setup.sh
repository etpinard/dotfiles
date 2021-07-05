#! /bin/bash -e

HERE=$(dirname "$(readlink -f "$0")")

echo 'Setup .julia/config/ directory'
mkdir -p ~/.julia/config

echo 'Link startup.jl'
pushd ~/.julia/config > /dev/null
ln -fs $HERE/startup.jl startup.jl
popd > /dev/null

echo 'Install startup.jl deps'
if [ -x "$(command -v julia)" ]; then
    julia -e 'using Pkg; Pkg.add("Revise"); Pkg.add("TerminalPager")'
else
    echo 'julia not in path, skip step'
fi
