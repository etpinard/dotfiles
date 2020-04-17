# bash

`~/.profile` -> `~/.bashrc` -> `~/.bash_aliases`

## Dependencies installed on `./_setup.sh`

- `z` https://github.com/rupa/z
- `bash-git-prompt` https://github.com/magicmonty/bash-git-prompt

## Environment variables

To setup environment variables available in every terminal session, export them in
`~/bin/vars` for example:

```
# in ~/bin/vars
export MY_VAR="my var value"
export OTHER_VAR="my other var value"
```

and these will be sourced automatically in `~/.profile`.
