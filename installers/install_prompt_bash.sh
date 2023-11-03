#!/bin/bash

# Function used to find and remove a multi-line block of text from a file.
# Usage: rm_block <FILENAME> <FIRST LINE SEARCH PATTERN> <LAST LINE SEARCH PATTERN>
rm_block() {
    if [ "$(which cut)" == "" ] ; then
        echo "ERROR: 'cut' command is required by this script but was not found."
        exit
    fi

    TARGET="$1"
    START_STRING="$2"
    END_STRING="$3"

    START=$(grep -n "$START_STRING" "$TARGET" | cut -d ':' -f 1)
    END=$(grep -n "$END_STRING" "$TARGET" | cut -d ':' -f 1)

    if [ "$START" != "0" ] ; then
        START=$(expr $START - 1)
    fi

    END=$(expr $END + 1)

    head -n $START "$TARGET" ; tail -n +$END "$TARGET"
}


# Check if this install script has been run on this computer before.
if [ "$(grep '### This section added by EDC ###' ~/.bashrc)" != "" ] ; then
    # Make a backup for safety
    cp ~/.bashrc ~/.bashrc.old

    # Remove lines previously added to ~/.bashrc by the install script.
    rm_block ~/.bashrc "### This section added by EDC ###" "### End section added by EDC ###" > .tmp-bashrc
    mv .tmp-bashrc ~/.bashrc
fi


# Now make changes...

echo >> ~/.bashrc
echo "### This section added by EDC ###" >> ~/.bashrc
cat bashrc_options.txt >> ~/.bashrc
echo "### End section added by EDC ###" >> ~/.bashrc

cat screenrc_options.txt > ~/.screenrc

sudo usermod -s $(which bash) $(whoami)





