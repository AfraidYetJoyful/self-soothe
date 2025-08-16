#!/bin/bash

cwd=$(pwd)
cd rooms

#FK TODO finish all the options
#FK TODO why does $scripts not work???
#FK TODO how do I use string so that it formats with newlines???
#FK TODO replace "read rm_name" with something a little more meant to accept strings

options="Options:
n[ew] new room\n
e[dit] n[ame] edit room name\n
e[dit] f[older] edit folder name\n
e[dit] t[ext] edit room text\n
l[ist] list file names, room names\n
q[uit] quit\n
"

if [[ $@ =~ n.* ]]; then
	echo "What is the name of the new room's folder?"
	read rm_fname
	echo "What is the name of the new room?"
	read rm_name
	if [ ${#rm_fname} == 0 ]; then
		exit 1
	fi
	if [ ${rm_name} == 0 ]; then
		exit 1
	fi
	echo "What is the text displayed when in the room? (press ENTER to continue)"
	read placeholder
	touch temp.txt
	$text_editor temp.txt
	if [ ${#$(cat temp.txt)} == 0 ]; then
		rm temp.txt
		exit 1
	fi

	mkdir $rm_fname
	cd $rm_fname
	touch name.txt
	echo $rm_name >> name.txt
	touch text.txt
	echo $(cat temp.txt) >> text.txt
	rm temp.txt
elif [[ $@ =~ l.* ]]; then
	#FK TODO
	echo todo
elif [[ $@ =~ "e\S* n\S*" ]]; then
	#FK TODO
	echo todo
elif [[ $@ =~ "e\S* f\S*" ]]; then
	#FK TODO
	echo todo
elif [[ $@ =~ "e\S* t\S*" ]]; then
	#FK TODO
	echo todo
elif [[ $@ =~ q.* ]]; then
	#FK TODO
	echo todo
else
	echo -e $options
	read option
	cd ..
	./room.sh $option
fi

cd $cwd	
