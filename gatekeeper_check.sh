#!/bin/bash

# Gatekeeper check

GATEKEEPER_CHECK=$(/usr/sbin/spctl --status)

if [ "$GATEKEEPER_CHECK" = "assessments enabled" ];
then
	GATEKEEPER="Enabled"
	echo "hitp-enabled: YES"
	echo "hitp-hidden: NO"
	echo "hitp-title: Gatekeeper : $GATEKEEPER"
else
	echo "hitp-enabled: NO"
	echo "hitp-hidden: NO"
	echo "hitp-title: Gatekeeper : Disabled"
fi

# All Checks

if [[ $GATEKEEPER = "" ]];
then
	echo "hitp-state: error"
else
	echo "hitp-state: ok"
fi

exit 0
