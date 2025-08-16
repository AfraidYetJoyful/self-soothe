#!/bin/bash

#FK where can you find the scripts?
scripts=~/self-soothe/called-scripts

#FK Load in environmental variables
cd $scripts
source ./environment-variables.sh

#FK Display welcome message
echo "Hello, $name! Welcome to $mind_place_name."

#FK Pray the Lord's Prayer (in future, have this as one of the options)
cd $scripts
source ./lords-prayer.sh

#FK run only script currently have
cd $scripts
echo ""
source ./make-mindscape.sh

#FK TODO option to ask for a cool fact
#FK TODO ask for and save name
#FK TODO ask how they're doing in a specific way (list of options)
#FK TODO use different args or flags to launch different scripts; also present a list of options of activities to do, followed by check ins


