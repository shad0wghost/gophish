#!/bin/bash

file1=/tmp/users
file2=/tmp/users2

#request sudo perms
echo Please enter sudo password
sudo echo thanks m8
sudo echo sudo password accepted
echo -------------------------------------------------------
echo "BRANDON'S SUPER PASSWORD RESET SCRIPT"
echo -------------------------------------------------------
#find and export users
cat /etc/passwd > $file1

#Read and find REAL users in the user file




cat $file1 | grep /bin/bash | cut -d: -f1 > $file2

#cleanup
mv $file2 $file1

#print out users on sys
echo Here are the users on the system:
cat $file1

#Begin to reset password via imput
	echo "Please tell me who's password you want to rest:"
read usr



#Check if user is on the system
grep -Fx $usr $file1

if [ $? -eq 0 ]
	then
		echo "Ok lets reset" '"'$usr'"'
		#reset the pass
		sudo passwd $usr

	else
		#fail condition
		echo No matching user found but lets try it anyway :D

		echo "Ok lets reset" '"'$usr'"'
		#reset the pass
		sudo passwd $usr
fi

#clean up
rm -rf $file1
