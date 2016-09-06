#!/bin/bash

file1=/tmp/users
file2=/tmp/users2
ranfile=/tmp/random

#request sudo perms
echo Please enter sudo password
sudo echo thanks m8
sudo echo sudo password accepted
echo -------------------------------------------------------
echo "BRANDON'S SUPER PASSWORD RANDOM SCRIPT"
echo -------------------------------------------------------
#find and export users
cat /etc/passwd > $file1

#Read and find REAL users in the user file

filename=/tmp/users.txt


cat $file1 | grep ,,,:/home/ | cut -d: -f1 > $file2

#cleanup 
mv $file2 $file1

#print out users on sys
echo Here are the users on the system:
cat $file1

#Begin to reset password via imput
	echo "Please tell me who's password you want to randomize:"
read usr



#Check if user is on the system
grep -Fx $usr $file1 > /dev/null

if [ $? -eq 0 ]
	then
		echo "Ok lets reset" '"'$usr'"'
		#Random number gen and move it to ranfile
password=$RANDOM

 	#random password var

			#read ranfile and print out results into passwd

#workin
	sudo yes $password | sudo passwd $usr


		echo "The new password for" '"'"$usr"'"' "is :"
		echo $password  

	else
		#fail condition
		echo No matching user found please try agin
		
fi

#clean up
rm -rf $file1
