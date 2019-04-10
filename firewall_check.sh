#!/bin/bash

# Check if Firewall is enabled

FW_CHECK=$(/usr/bin/python -c "from Foundation import CFPreferencesCopyAppValue ; print(CFPreferencesCopyAppValue('globalstate', 'com.apple.alf'))")
# /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate

if [ "$FW_CHECK" = 1 ];
then
	echo "hitp-enabled: YES"
	echo "hitp-hidden: NO"
	echo "hitp-title: Firewall : Enabled"
else
	echo "hitp-enabled: NO"
	echo "hitp-hidden: NO"
	echo "hitp-title: Firewall : Disabled"
fi

if [[ "$FW_CHECK" = 1 ]];
then
	echo "hitp-state: ok"
else
	echo "hitp-state: error"
fi

exit 0
