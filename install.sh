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

#FK find the current directory
install_script_dir=$(pwd)

#FK get the intended parent directory for self-soothe
intended_parent=$(realpath $1)
cd $intended_parent || error_exit "the intended parent directory is invalid"

#FK get the launcher script directory
if [ $# == 2 ]; then
	cd $install_script_dir
	launcher_location=$(realpath $2)
	cd $launcher_location || error_exit "the intended launcher script directory is invalid"
else
	launcher_location="$intended_parent/self-soothe"
fi

#FK clone the self-soothe directory to the appropriate place
cd $intended_parent
git clone https://github.com/AfraidYetJoyful/self-soothe.git || error_exit "something went wrong when cloning the git repository"

#FK make a self-soothe launcher script
cd $launcher_location #FK move to desired location for self-soothe launcher script
touch launcher-ss.sh
echo "cd $intended_parent/self-soothe" >> launcher-ss.sh
echo "./self-soothe.sh" >> launcher-ss.sh
echo "cd $launcher_location" >> launcher-ss.sh
chmod +x launcher-ss.sh

#FK remove this file
cd $install_script_dir
rm $0

#FK move to the launcher script's directory
cd $launcher_location
