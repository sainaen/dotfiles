## About

This repository's kind of the cherry-picks from home folder. So it's nead to be cloned with command like this:

	git clone https://github.com/sainaen/dotfiles.git ~/

## In it
At this point, it contains:

* Sublime Text 2 preferences file, custom icon and `.desktop` file for it
* Global `.gitconfig` <small>(with a bunch of aliases)</small> and `.gitignore`
* [Tomorrow](https://github.com/chriskempson/tomorrow-theme) profile for gnome-terminal and script to setup colors in it
* `functions.sh` file with a small handy shell functions (like python simple http server)
* Openbox config (`autostart.sh` and menu)
* My [tint2](code.google.com/p/tint2/) theme
* Midnight Commander config file <small>(now only difference is a `xoria256` as skin)</small>

As submodules:

* [zsh-syntax-highlighting plugin](https://github.com/zsh-users/zsh-syntax-highlighting)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

## Notes and hints

* `sublime_files/sublime_text.desktop` should be placed in `/usr/share/applications/`
* to clone repository with all submodules use `git clone --recursive`

## ToDo

* add list of existing aliases (git aliases too) with short description for each of them
* write a shell script to copy files
* add `.fonts.conf`?
* add config files for Sublime packages (e.g. SublimeBuildOnSave)
* add custom Sublime build system for cakefiles
* learn some cools tricks from other's dotfiles (for example [Ben Alman](https://github.com/cowboy/dotfiles) and [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) have great dotfiles)
