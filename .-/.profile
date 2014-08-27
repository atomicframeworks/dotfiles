# OS and CWD
OS=`uname`
DOTCWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# If ~.bashrc exists execute it
if [ -f "$DOTCWD/../config.cfg" ]; then
    . "$DOTCWD/../config.cfg"
fi

test "$DOTSILENT" == false && echo -e '\n*****************************************\n*\t      .- Dotfiles\t\t*\n*****************************************\n*\t\t\t\t\t*';

# If ~.bashrc exists source it in
if [ -f ~/.bashrc ]; then
    test "$DOTSILENT" == false && echo -e "*  .- Sourced in ~/.bashrc file\t\t*"
    . ~/.bashrc
fi

# Load the shell dotfiles and create edit aliases for them
for file in .{paths,functions,exports,aliases,extras}; do
	[ -r "$DOTCWD/$file" ] && [ -f "$DOTCWD/$file" ] && . "$DOTCWD/$file" && alias .-$file="\$EDITOR $DOTCWD/$file";
done;

# Manually add profile, bootstrap, and config aliases as part of core profile
alias .-.profile="$EDITOR $DOTCWD/.profile";
alias .-.bootstrap="$EDITOR $DOTCWD/../bootstrap.sh";

test "$DOTSILENT" == false && echo -e '*\t\t\t\t\t*\n*****************************************\n';