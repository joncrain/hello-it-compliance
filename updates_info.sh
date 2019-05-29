#!/bin/bash
# Pending Updates Script for Managed Software Center
### The following line load the Hello IT bash script lib
. "$HELLO_IT_SCRIPT_SH_LIBRARY/com.github.ygini.hello-it.scriptlib.sh"

function onClickAction {
  /usr/bin/open /Applications/Managed\ Software\ Center.app
}

function fromCronAction {
   setTitleAction "$@"
}

function setTitleAction {
  pendingupdates="$(defaults read /Library/Preferences/ManagedInstalls.plist PendingUpdateCount)"
  #echo "$pendingupdates"
  if [ "$pendingupdates" = 0 ];
  then
    # usage: updateTitle "My new title"
    # first arg only will be used as new title, don't forget quotes
    updateTitle "No Pending Updates"
    # usage: updateState ${STATE[0]}
    # supported states are managed by the STATE array
    # ${STATE[0]} --> OK (Green light)
    # ${STATE[1]} --> Warning (Orange light)
    # ${STATE[2]} --> Error (Red light)
    # ${STATE[3]} --> Unavailable (Empty circle)
    # ${STATE[4]} --> No state to display (Nothing at all)
    updateState "${STATE[0]}"
    updateTooltip "🎉No Available Updates!🎉"

  else
    if [ "$(defaults read /Library/Preferences/ManagedInstalls.plist RestartRequired 2> /dev/null)" ]; then
      updateTitle "Pending Updates: $pendingupdates. Restart Required!"
      updateState "${STATE[2]}"
      updateTooltip "Your updates require a restart!"
    else
      updateTitle "Pending Updates: $pendingupdates"
      updateState "${STATE[1]}"
      updateTooltip "Updates Available."
    fi
  fi

}

### The only things to do outside of a bash function is to call the main function defined by the Hello IT bash lib.
main "$@"

exit 0