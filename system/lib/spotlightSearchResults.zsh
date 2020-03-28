#! /usr/local/bin/zsh

defaults delete com.apple.Spotlight orderedItems

SCAT=$@
SNUM=$(expr $# / 2)

PLIST="${HOME}/Library/Preferences/com.apple.Spotlight"
/usr/libexec/PlistBuddy -c "Add orderedItems array" ${PLIST}

foreach idx ($(seq 0 $(expr ${SNUM} - 1)))
	CATN=${SCAT[$(( ${idx} * 2     ))]}
	CATB=${SCAT[$(( ${idx} * 2 + 1 ))]}

	/usr/libexec/PlistBuddy \
		-c "Add persistent-apps:${idx} dict" \
		-c "Add persistent-apps:${idx}:enabled bool ${CATB}" \
		-c "Add persistent-apps:${idx}:name string ${CATN}" \
		${PLIST}
end