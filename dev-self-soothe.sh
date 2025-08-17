#!/bin/bash

#FK not necessary, but helps in development of self-soothe to keep you motivated and organized (hopefully)

if [ $# == 0  ]; then
	this_file_location=$(pwd)
fi
if [ $# == 1 ]; then
	this_file_location=$1
fi

echo "Hello, developer! Welcome back to the project. :)"
echo "I'm so glad you made it. <3"
echo "Where would you like to begin?"
read goal
echo "Sounds great! I'll check in with you after 20 commands. Let's begin!"

for x in {1..20};
do
	echo -n ">>>"
	read input
	if [[ input =~ \./.* ]]; then
		source $input
	else
		$input
	fi
done

echo "Nice work! Let's check in on your goal. You had the goal: $goal"
echo "Did you get closer to completing it?"
read thoughts
echo "Okay."
echo "Regardless, I'm glad you're here. <3"
echo "Want to continue? (y/n)"
read continuing
if [ $continuing == "y" ]; then
	temp=$(pwd)
	cd $this_file_location
	./dev-self-soothe.sh temp
fi
