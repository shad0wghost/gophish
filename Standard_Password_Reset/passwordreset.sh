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
	echo "(or type "'"all"'" to change all users passwords simultaneously)"
read usr



#Check if user is on the system
grep -Fx $usr $file1

if [ $? -eq 0 ]
	then
		echo "Ok lets reset" '"'$usr'"'
		#reset the pass
		sudo passwd $usr
#if user types all
elif [[ $usr = "all" ]]; then
	#yes no thing

	echo you have elected to change all of the users passwords are you sure? [yes/no]
	read makesure
			if [ $makesure = "yes" ]
			then
					echo "ok what do you want EVERYONE's password to be?"
					read passwordall
					echo give me a sec changin teh passwords

											#all passwrod changer

											for i in `cat $file1`; do
						sudo yes $passwordall | sudo passwd $i
					done
echo "Ok everyone's password is now" $passwordall

			else
				echo "KK fam will not change everyone's password"
		fi
	else
		#fail condition
		echo No matching user found but lets try it anyway :D

		echo "Ok lets reset" '"'$usr'"'
		#reset the pass
		sudo passwd $usr
fi

#clean up
rm -rf $file1
