#!/bin/bash

# Check if SIP is enabled

SIP_CHECK=$(/usr/bin/csrutil status)

if [ "$SIP_CHECK" = "System Integrity Protection status: enabled." ];
then
	SIP="Enabled"
	echo "hitp-enabled: YES"
	echo "hitp-hidden: NO"
	echo "hitp-title: SIP : $SIP"
else
	echo "hitp-enabled: NO"
	echo "hitp-hidden: NO"
	echo "hitp-title: SIP : Disabled"
fi

# All Checks

if [[ $SIP = "" ]];
then
	echo "hitp-state: error"
else
	echo "hitp-state: ok"
fi

exit 0
