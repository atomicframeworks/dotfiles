# .- Dotfiles
Convenient aliases, sensible defaults, and more for your dotfiles.

* Slew of conveniently organized aliases and functions
* Extend $PATH with common bin folders automatically
* Auto symlink Sublime Text and TextMate editors for shell commands
* Auto load and alias any files added to .-aliases folder
* Customizable and extensible
* Sensible defaults


## Install
You can install by cloning the repository and running the bootstrap script.

```bash
git clone https://github.com/atomicframeworks/dotfiles.git && . dotfiles/bootstrap.sh
````

## Config
To set a config variable you can use the command `.-.config` to open the file for editing.
Another way is by using the .-.config function.  By passing arguments to .-. config you can set values.  The first argument is the variable name to set and the second is the value.

Ex:
````bash
.-.config silent false
````

Setting the editor config variable will overrides .- dotfiles editor export preference.  For example if you had the Sublime 

Ex:
````bash
.-.config editor vim
````
## Updating
There are multiple ways to update:
1 Set the autoupdate variable in .-.config to true.  This will run a git pull each load on the .- directory.
2 Run the `.-.update` command.  This will run a git pull on the .- directory.
3 Manually update using git.


## Editing .- dotfiles
All  .- dotfiles files are aliased for editing by a convention of their directory and name. 

######Core file (do not delete)
.-.aliases
.-.config
.-.exports
.-.extras
.-.functions
.-.paths
.-.profile

All dotfiles in the .-aliases directory are automatically aliased for editing.  If a new dotfile is added to the .-aliases directory it will automatically be loaded and aliased similarly to the following already included files.

######Alias modules (safe to delete if desired) 
.-.aliases.apache

.-.aliases.misc
.-.aliases.mongodb
.-.aliases.php
.-.aliases.python
.-.aliases.ruby
.-.aliases.vcs


## Aliases
There is a slew of added aliases, and they are loaded conditionally.  Some depend on OS, others on a language or command to be installed. 

Rather than list them all out the best way to see what commands are added is to simply check out the .-.alias files by using the aliases listed in the above `editing .- dotfiles` section.