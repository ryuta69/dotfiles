#! /bin/bash

defaults delete com.apple.Spotlight orderedItems

SCAT=$@
SNUM=$(expr $# / 2)

PLIST="${HOME}/Library/Preferences/com.apple.Spotlight"
/usr/libexec/PlistBuddy -c "Add orderedItems array" ${PLIST}

for idx in $(seq 0 $(expr ${HNUM} - 1)); do
	CATN=${SCAT[$(( ${idx} * 2     ))]}
	CATB=${SCAT[$(( ${idx} * 2 + 1 ))]}

	/usr/libexec/PlistBuddy \
		-c "Add persistent-apps:${idx} dict" \
		-c "Add persistent-apps:${idx}:enabled bool ${CATB}" \
		-c "Add persistent-apps:${idx}:name string ${CATN}" \
		${PLIST}
done
