# .- Dotfiles
Convenient aliases, useful functions, and other goodies for your dotfiles.

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
There are multiple ways to set a config variable:
* Use the command `.-.config` to open the file for editing and change the value.
* Using the `.-.config` function.  By passing arguments to `.-.config` you can set values.  The first argument is the variable name to set and the second is the value.

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
* Set the autoupdate variable to true by editing `.-/.config` file.  This setting will run a git pull each load on the .- directory.
* Execute the `.-.update` command.  This will execute a `git pull` on the .- directory.
* Manually update using git.


## Editing .- dotfiles
All  .- dotfiles files are aliased for editing by a convention of their directory and name. 

####Core files (do not delete)
<table>
    <tr>
        <th>
            File
        </th>
        <th>
            Edit Alias
        </th>
    </tr>
    <tr>
        <th>
            .-/.aliases
        </th>
        <th>
            .-.aliases
        </th>
    </tr>
    <tr>
        <th>
            .-/.config
        </th>
        <th>
            .-.config
        </th>
    </tr><tr>
        <th>
            .-/.exports
        </th>
        <th>
            .-.exports
        </th>
    </tr><tr>
        <th>
            .-/.extras
        </th>
        <th>
            .-.extras
        </th>
    </tr><tr>
        <th>
            .-/.functions
        </th>
        <th>
            .-.functions
        </th>
    </tr><tr>
        <th>
            .-/.paths
        </th>
        <th>
            .-.paths
        </th>
    </tr><tr>
        <th>
            .-/.profile
        </th>
        <th>
            .-.profile
        </th>
    </tr>
</table>


####Alias modules (safe to delete) 
All dotfiles in the .-/.-aliases directory are automatically aliased for editing.  If a new dotfile is added to the .-aliases directory it will automatically be loaded and aliased similarly to the following already included files.
<table>
    <tr>
        <th>
            File
        </th>
        <th>
            Edit Alias
        </th>
    </tr>
    <tr>
        <th>
            .-/.-aliases/.apache
        </th>
        <th>
            .-.aliases.apache
        </th>
    </tr>
    <tr>
        <th>
            .-/.-aliases/.misc
        </th>
        <th>
            .-.aliases.misc
        </th>
    </tr>
    <tr>
        <th>
            .-/.-aliases/.mongodb
        </th>
        <th>
            .-.aliases.mongodb
        </th>
    </tr>
    <tr>
        <th>
            .-/.-aliases/.php
        </th>
        <th>
            .-.aliases.php
        </th>
    </tr>
    <tr>
        <th>
            .-/.-aliases/.python
        </th>
        <th>
            .-.aliases.python
        </th>
    </tr>
    <tr>
        <th>
            .-/.-aliases/.ruby
        </th>
        <th>
            .-.aliases.ruby
        </th>
    </tr>
    <tr>
        <th>
            .-/.-aliases/.vcs
        </th>
        <th>
            .-.aliases.vcs
        </th>
    </tr>
</table>

## Aliases
There is a slew of added aliases, and they are loaded conditionally.  Some depend on OS, some depend on a language, and others require a command to be installed. 

Rather than list them all out the best way to see what commands are added is to simply check out the .-.alias files by using the aliases listed in the above `editing .- dotfiles` section.
