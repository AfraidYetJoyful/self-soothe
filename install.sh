#!/bin/bash

help_message="-------------------------------- \n
Help message for self-soothe install script \n
\n
Usage: ./install.sh [--help] <parent_directory_for_self-soothe> [<destination_for_launcher_script] \n
\n
Purpose: This script installs the self-soothe program. \n
\n
Options: \n
--help \t Displays this help message \n
\n
Parent directory for self soothe: The folder that you want the self-soothe folder to be placed in. \n
\n
Destination for launcher script: The folder that you want the script that launches self-soothe to be placed in. This script will be called ss-launcher.sh by default. The default location for the launcher script is the self-soothe folder.\n
"

function do_help {
	echo -e $help_message
	exit
}

function error_exit {
	echo -e $1
	exit
}

#FK if no arguments are entered, print help message and exit
if [ $# == 0 ]; then
	do_help
fi
#FK if the help option is included, print help message and exit
if [ $1 == "--help" ]; then
	do_help
fi

#FK get the intended parent directory for self-soothe
intended_parent=$1
cd $intended_parent || error_exit "the intended parent directory is invalid"

#FK get the launcher script directory
if [ $# == 2 ]; then
	launcher_location=$2
	cwd=$(pwd)
	cd $launcher_location || error_exit "the intended launcher script directory is invalid"
	cd $cwd
else
	launcher_location="$intended_parent/self-soothe"
fi

#FK clone the self-soothe directory to the appropriate place
cd $intended_parent
git clone https://github.com/AfraidYetJoyful/self-soothe.git || error_exit "something went wrong when cloning the git repository"

#FK make a self-soothe launcher script
touch ss-launcher.sh
echo "cd $intended_parent/self-soothe" >> ss-launcher.sh
echo "./self-soothe.sh" >> ss-launcher.sh
echo "cd $launcher_location" >> ss-launcher.sh
chmod +x ss-launcher.sh

#FK move the self-soothe launcher script to desired location
mv ss-launcher.sh $launcher_location

#FK move to the launcher script's directory
cd $launcher_location
