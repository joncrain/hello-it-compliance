#!/bin/bash
# Get Filevault Info
. "$HELLO_IT_SCRIPT_SH_LIBRARY/com.github.ygini.hello-it.scriptlib.sh"

function onClickAction {
  /usr/bin/open -b com.apple.systempreferences /System/Library/PreferencePanes/Security.prefPane
}

function setTitleAction {
    filevault_check="$(fdesetup status)"
    if [[ "$filevault_check" == "FileVault is Off." ]];
    then
    # updateState "${STATE[4]}"
    filevault="Disabled"
    else
    # updateState "${STATE[4]}"
    filevault="Enabled"
    fi
    updateState "${STATE[4]}"
    updateTitle "FileVault : $filevault"
}

main "$@"

exit 0