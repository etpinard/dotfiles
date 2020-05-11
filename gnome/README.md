# Gnome

Setup Gnome key bindings and preferences using `dconf`.

## Adding new setting

### Method 1: dump current settings

```
cd ~/Documents/repos/dotfiles/gnome
dconf dump / > dconf-dump.txt

# find relevant settings and copy them one of the .conf files here
```

**N.B.** `dconf-dump.txt` is git-ignored (as it can contain certificates and other sensitive info).

### Method 2: watch and edit

```
dconf watch /

# and edit settings in the `settings` or `gnome-tweaks` app
```

----

Inspired by https://github.com/catern/dotfiles/tree/master/home/.config/dconf/user.d - shoutout!

## Gnome extensions (experimental)

```
./_setup extensions

# uses `gnome-shell-extension-tool` to enable settings
```

## Themes

On Debian 10:

```
sudo ap install arc-theme

# enable it in `gnome-tweaks` app
```
