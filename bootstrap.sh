#! /bin/bash

# .-.bootstrap
# Used to `install` and toggle on/off .- dotfiles

#git pull origin master;

# Search flag to determine if we have installed
DOTFLAG="#.-"

# Current directory
DOTCWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Possible places for profile script to be loaded
DOTBASHPROFILEPATH=~/.bash_profile
DOTBASHLOGINPATH=~/.bash_login
DOTPROFILEPATH=~/.profile

# Add the .- source files
add_dot_source() {
    echo "Adding $DOTFLAG in to $1"
    # Make sure file ends with a newline
    sed -i '' -e '$a\' "$1"
    echo -e "$DOTFLAG\nsource \"$DOTCWD/.-/.profile\"" >> "$1"
}

# Remove the .- source files
remove_dot_source() {
    echo "Removing $DOTFLAG from $1"
    awk '/#.-/{getline;next} 1' "$1" > "$1.tmp" && mv "$1.tmp" "$1"
}

# Check where we should add #.-
# When Bash is invoked as n interactive shell it loads the first script in order of
# ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order
if [ -f "$DOTBASHPROFILEPATH" ]
then
    if grep -Fxq "$DOTFLAG" "$DOTBASHPROFILEPATH"
    then
        remove_dot_source "$DOTBASHPROFILEPATH"
    else
        add_dot_source "$DOTBASHPROFILEPATH"
    fi
elif [ -f "$DOTBASHLOGINPATH" ]
then    
    if grep -Fxq "$DOTFLAG" "$DOTBASHLOGINPATH"
    then
        remove_dot_source "$DOTBASHLOGINPATH"
    else
        add_dot_source "$DOTBASHLOGINPATH"
    fi
elif [ -f "$DOTPROFILEPATH" ]
then    
    if grep -Fxq "$DOTFLAG" "$DOTPROFILEPATH"
    then
        remove_dot_source "$DOTPROFILEPATH"
    else
        add_dot_source "$DOTPROFILEPATH"
    fi
else
    echo "Warning: Could not find file $DOTBASHPROFILEPATH, $DOTBASHLOGINPATH, or $DOTPROFILEPATH"
    echo "Warning: Creating $DOTPROFILEPATH"
    echo "" >> "$DOTBASHPROFILEPATH" && add_dot_source "$DOTBASHPROFILEPATH"
fi