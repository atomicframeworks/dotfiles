# .-.profile
# Used to init .- dotfiles 

# OS and CWD
OS=`uname`
DOTCWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check if $TERM supports colors
TPUTCOLORS=$(tput -T $TERM colors)

# Cache initial prompt value for testing if modified in .-.config
PS1CACHE=$PS1

# Append the new history lines (history lines entered since the beginning of the current Bash session) to the history file.
history -n

# If .-.config exists include it
if [ -f "$DOTCWD/.config" ]; then
    . "$DOTCWD/.config"
fi

# If auto update config is true then update each load
test "$AUTOUPDATE" == true && (cd "$DOTCWD/../"; git pull origin master)

# Check if we should always sudo
if [ "$SUDOALWAYS" == true ]; then
    # Ask for the administrator password upfront
    sudo -v;
    # Update existing `sudo` time stamp until `.osx` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

test "$SILENT" == false && echo -e '\n*****************************************\n*\t      .- Dotfiles\t\t*\n*****************************************\n*\t\t\t\t\t*';

# If ~.bashrc exists source it in
if [ -f ~/.bashrc ]; then
    test "$SILENT" == false && echo -e "*  .- Sourced in ~/.bashrc file\t\t*"
    . ~/.bashrc
fi

# If bash completion exists source it in
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# If inputrc does not exists create it with options
if [ ! -f ~/.inputrc -a ! -f /etc/inputrc ]; then
    test "$SILENT" == false && echo -e '*\t\t\t\t\t*\n*  Adding options to ~/.inputrc \t*'
    echo -e "set completion-ignore-case on\nset show-all-if-ambiguous on\nset show-all-if-unmodified on" >> ~/.inputrc
fi

# Load the shell dotfiles and create edit aliases for them
for file in .{paths,functions,exports,aliases,extras}; do
    [ -r "$DOTCWD/$file" ] && [ -f "$DOTCWD/$file" ] && . "$DOTCWD/$file" && alias .-$file="\$EDITOR \"$DOTCWD/$file\"";
done;

# Manually add profile, bootstrap, and config aliases as part of core profile
alias .-.profile="$EDITOR \"$DOTCWD/.profile\"";
alias .-.bootstrap="$EDITOR \"$DOTCWD/../bootstrap.sh\"";

test "$SILENT" == false && echo -e '*\t\t\t\t\t*\n*****************************************\n';