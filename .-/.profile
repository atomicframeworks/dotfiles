# .-.profile
# Used to init .- dotfiles 

# OS and CWD
OS=`uname`
DOTCWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# If ~.bashrc exists include it
if [ -f $DOTCWD/.config ]; then
    . $DOTCWD/.config
fi

# If auto update config is true then update each load
test "$AUTOUPDATE" == true && (cd $DOTCWD/../; git pull origin master)

# Ask for the administrator password upfront
test "$SUDOALWAYS" == true && sudo -v
# Update existing `sudo` time stamp until `.osx` has finished
test "$SUDOALWAYS" == true && while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

test "$SILENT" == false && echo -e '\n*****************************************\n*\t      .- Dotfiles\t\t*\n*****************************************\n*\t\t\t\t\t*';

# If ~.bashrc exists source it in
if [ -f ~/.bashrc ]; then
    test "$SILENT" == false && echo -e "*  .- Sourced in ~/.bashrc file\t\t*"
    . ~/.bashrc
fi

# Load the shell dotfiles and create edit aliases for them
for file in .{paths,functions,exports,aliases,extras}; do
	[ -r "$DOTCWD/$file" ] && [ -f "$DOTCWD/$file" ] && . "$DOTCWD/$file" && alias .-$file="\$EDITOR $DOTCWD/$file";
done;

# Manually add profile, bootstrap, and config aliases as part of core profile
alias .-.profile="$EDITOR $DOTCWD/.profile";
alias .-.bootstrap="$EDITOR $DOTCWD/../bootstrap.sh";

test "$SILENT" == false && echo -e '*\t\t\t\t\t*\n*****************************************\n';