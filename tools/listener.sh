#!/bin/bash

source ../environment-variables.sh #FK import environment variables for self-soothe

#FK make it so that read won't seperate the response into different fields with a space
IFS="\n" 
#FK prompt the user for their response and store it in response variable
echo -e "Do you have something that you'd like to say, $name?"
read response
#FK reset IFS so that normal space-seperated things will still work
unset IFS 

#FK put the response in a text file for later
echo response >> listener-responses.txt

#FK respond and check if they'd like to continue
echo -e "Okay."
read -p "Would you like to continue talking with me? (y/n)" keepgoing

if [ $keepgoing == "y" ]; then
	./listener.sh
fi
