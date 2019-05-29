#!/bin/bash
# Get result of last detectx run
. "$HELLO_IT_SCRIPT_SH_LIBRARY/com.github.ygini.hello-it.scriptlib.sh"

function onClickAction {
  /usr/bin/open -a /Applications/Utilities/DetectX\ Swift.app/
}

function setTitleAction {
    DETECTX_CHECK="$(python -c 'import json,os;
with open(os.path.abspath("/usr/local/munki/preflight.d/cache/detectx.json")) as file:
    print(len(json.load(file)["issues"]))')"
    if [[ "$DETECTX_CHECK" == 0 ]];
    then
    updateState "${STATE[0]}"
    malware_title="Not found"
    else
    updateState "${STATE[2]}"
    malware_title="Found $DETECTX_CHECK Items"
    fi
    updateTitle "Malware: $malware_title"
}

main "$@"

exit 0