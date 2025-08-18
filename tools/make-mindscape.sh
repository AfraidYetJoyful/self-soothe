#!/bin/bash

#FK import environment variables
source ../environment-variables.sh

#FK intro message
#FK TODO move this part into a more general 'make-stuff-intro' script
echo "Hello, $name! So glad you could make it, friend.

Welcome to the place where you make stuff in $mind_place_name.
"
	
#FK give the options of things to do and execute the appropriate script
echo "Your options for things you can make/edit are:
- r[ooms]

What will you make/edit?"

read thing
if [[ $thing =~ r.* ]]; then
	cd $tools_location
	source ./room.sh
fi
