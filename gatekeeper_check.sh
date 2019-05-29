#!/bin/bash
# Gatekeeper check
. "$HELLO_IT_SCRIPT_SH_LIBRARY/com.github.ygini.hello-it.scriptlib.sh"

function onClickAction {
  /usr/bin/open -b com.apple.systempreferences /System/Library/PreferencePanes/Security.prefPane
}

function setTitleAction {
    GATEKEEPER_CHECK=$(/usr/sbin/spctl --status)

    if [[ "$GATEKEEPER_CHECK" = "assessments enabled" ]];
    then
    updateState "${STATE[0]}"
    GATEKEEPER="Enabled"
    else
    updateState "${STATE[2]}"
    GATEKEEPER="Disabled"
    fi
    updateTitle "Gatekeeper : $GATEKEEPER"
}

main "$@"

exit 0