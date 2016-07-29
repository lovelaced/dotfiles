# dotfiles

Add any config dirs into dotfile_setup.py, add them to folder, then deploy.

Requires the following to be installed:

* bspwm
* sxhkd
* zsh
* xmodmap
* xbindkeys
* zsh-syntax-highlighting
* weechat

Bar, which requires conky, can be found in the bspwm-conkbar repo.

NOTE: if you're doing this on a fresh install, you may have to do the following:
```
mkdir ~/.config && cd ~/.config
mkdir bspwm && mkdir sxhkd && mkdir termite
```

![screenshot](example.png?raw=true)
