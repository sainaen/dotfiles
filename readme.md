## About

It’s nead to be cloned with command like this:

	git clone --recursive https://github.com/sainaen/dotfiles.git ~/dotfiles

## In it
At this point, it contains:

* Sublime Text 2 preferences file, some config files for its plugins, custom icon and `.desktop` file for it
* Global `.gitconfig` <small>(with a bunch of aliases)</small> and `.gitignore`
* `functions.sh` file with a small handy shell functions (like python simple http server)
* Openbox config (`autostart.sh` and menu)
* My [tint2](code.google.com/p/tint2/) theme

Depends on:

* [zsh-syntax-highlighting plugin](https://github.com/zsh-users/zsh-syntax-highlighting)
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [vundle](https://github.com/gmarik/vundle)

## Notes and hints

* `sublime_files/sublime_text.desktop` should be placed in `/usr/share/applications/`

## ToDo

* write a shell script to setup
* update readme
