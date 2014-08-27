#! /bin/bash

#git pull origin master;

# Search flag to determine if we have installed
DOTFLAG="#.-"

# Current directory
DOTCWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Possible places for profile script to be loaded
DOTBASHPROFILEPATH=~/.bash_profile
DOTBASHLOGINPATH=~/.bash_login
DOTPROFILEPATH=~/.profile

# Make sure file ends with a newline
ensureNewLine() {
    sed -i '' -e '$a\' $1
}

# Add the .- source files
addDotSource() {
    echo "Adding $DOTFLAG in to $1"
    ensureNewLine $1
    echo -e "$DOTFLAG\nsource $DOTCWD/.-/.profile" >> $1
}

# Remove the .- source files
removeDotSource() {
    echo "Removing $DOTFLAG from $1"
    awk '/#.-/{getline;next} 1' $1 > $1.tmp && mv $1.tmp $1
}

# Check where we should add #._.
# WHen Bash is invoked as n interactive shell it loads the first script in order of
# ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order
if [ -f $DOTBASHPROFILEPATH ]
then
    if grep -Fxq "$DOTFLAG" $DOTBASHPROFILEPATH
    then
        removeDotSource $DOTBASHPROFILEPATH
    else
        addDotSource $DOTBASHPROFILEPATH
    fi
elif [ -f $DOTBASHLOGINPATH ]
then    
    if grep -Fxq "$DOTFLAG" $DOTBASHLOGINPATH
    then
        removeDotSource $DOTBASHLOGINPATH
    else
        addDotSource $DOTBASHLOGINPATH
    fi
elif [ -f $DOTPROFILEPATH ]
then    
    if grep -Fxq "$DOTFLAG" $DOTPROFILEPATH
    then
        removeDotSource $DOTPROFILEPATH
    else
        addDotSource $DOTPROFILEPATH
    fi
else
    echo "Warning: Could not find files $DOTBASHPROFILEPATH, $DOTBASHLOGINPATH, $DOTPROFILEPATH"
    echo "Warning: Creating $DOTPROFILEPATH"
    echo "" >> $DOTBASHPROFILEPATH && addDotSource $DOTBASHPROFILEPATH
fi