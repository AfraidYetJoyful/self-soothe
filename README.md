# self-soothe
Text-based walkthroughs of self-soothing helpful to AfraidYetJoyful.

Next steps:
- debug the room creation script
- take a break from rooms and routes for the moment and do something small and achievable and fun
- make a tiny driver outside of self-soothe that calls the script in self-soothe
- fix the folder scheme
	- objects folder
	- rooms folder inside objects folder
	- scripts that work on rooms go in a folder inside rooms
	- make a folder for non-dev scripts (so, users that aren't devs)? (ONLY IF NEEDED)
	- make a folder for dev scripts? (ONLY IF NEEDED)
	- make a folder for all-user scripts (e.g. lords-prayer)
- change $mind-place (or whatever it is) to $happy-place (to allow for different future mind places being explored)
- pare down each script to the bare bones

Reminders:
- only make the next small bit that you need
	- make a tiny driver first
	- have the tiny driver call a tiny script that manipulates the object in exactly the way you need
	- expand the tiny driver to do one more thing
	- have the tiny script take one option to distinguish between the first thing and second thing
	- write that second thing
	- fix the things in the tiny driver
	- etc.
 - make testing scripts

Future features:
- When exploring the mind places in "explore and create later" mode, you explore normally, and also have an action where you can add notes for yourself of things to change/fix/do, which are appended to a future-changes.txt file
- In the above "explore and create later" mode, have what happens at the end be a 'create' script/program, which shows you the contents of future-changes.txt as you go, displayed with their line number, and when you tell the program that you completed a line, it removes it from the file and displays a congratulations message 
- Make an "explore and create" mode, where you explore normally, and can at any time pause and enter create mode

Future refactors:
- Things like rooms are called 'objects'. The rooms folder goes in the 'objects' folder.
- An object has a unique id (UUID) that is the name of its folder. Within the 'objects' folder is a file called '.next-uuid' which contains a number that is the next available UUID
- Each bit of information about the object except its UUID and its type are stored in files in the folder. The type of the bit of information is the title of the file. If there are multiple bits of information of the same type and purpose, there is a folder which is titled with that type/purpose, and the files within are labeled with UUIDs as well.
- A script for creating objects, help section included
- Driver programs for creating objects-- can be scripts that take input one input at a time, can be things that pull up forms to fill out, etc. -- help sections included (can also be based on object type)
- A script for editing one field of an object, help section included
- Driver programs for editing objects
- A script that shows an object's information in various readable formats
