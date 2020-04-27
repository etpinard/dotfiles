# Gnome

Setup Gnome key bindings and preferences using `dconf`.

## Adding new setting

### Method 1: dump current settings

```
cd ~/Documents/repos/dotfiles/gnome
dconf dump / > dconf-dump.txt
```

**N.B.** `dconf-dump.txt` is git-ignored (as it can contain certificates and other sensitive info).

### Method 2: watch and edit

```
dconf watch /
```

----

Inspired by https://github.com/catern/dotfiles/tree/master/home/.config/dconf/user.d - shoutout!
