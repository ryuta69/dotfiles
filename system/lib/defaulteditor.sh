#! /bin/bash

LSCT=("public.json" "com.netscape.javascript-source")
PLIST="${HOME}/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist"
HNUM=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:" ${PLIST} | grep -P '^[\s]*Dict' | wc -l | tr -d ' ')

for idx in $(seq 0 $(expr ${HNUM} - 1)); do
	THIS_LSCT=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:${idx}:LSHandlerContentType" ${PLIST} 2>/dev/null)
	if [[ ${LSCT[@]} =~ $THIS_LSCT ]]; then
		/usr/libexec/PlistBuddy -c "Set LSHandlers:${idx}:LSHandlerRoleAll com.apple.textedit" ${PLIST}
	fi;
end
