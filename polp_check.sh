#!/bin/bash

# Get logged-in user
loggedInUser=$(/usr/bin/python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')

if groups $loggedInUser | grep -q -w admin; 
then 
    admin="yes"; 
fi

if [ "$admin" = "yes" ];
then
	echo "hitp-enabled: YES"
	echo "hitp-hidden: NO"
	echo "hitp-title: User : Admin User"
else
	echo "hitp-enabled: NO"
	echo "hitp-hidden: NO"
	echo "hitp-title: User : Standard User"
fi

# All Checks

if [[ $admin = "yes" ]];
then
	echo "hitp-state: error"
else
	echo "hitp-state: ok"
fi

exit 0