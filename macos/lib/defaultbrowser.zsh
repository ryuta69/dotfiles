#! /usr/local/bin/zsh

LSSC=("http" "https")
LSCT=("public.xhtml" "public.html")
PLIST="${HOME}/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist"
HNUM=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:" ${PLIST} | grep -P '^[\s]*Dict' | wc -l | tr -d ' ')

foreach idx ($(seq 0 $(expr ${HNUM} - 1)))
	THIS_LSSC=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:${idx}:LSHandlerURLScheme" ${PLIST} 2>/dev/null)
	if [[ ${LSSC[(i)${THIS_LSSC}]} -le ${#LSSC} ]]; then
		/usr/libexec/PlistBuddy -c "Set LSHandlers:${idx}:LSHandlerRoleAll com.google.chrome" ${PLIST}
	fi;

	THIS_LSCT=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:${idx}:LSHandlerContentType" ${PLIST} 2>/dev/null)
	if [[ ${LSCT[(i)${THIS_LSCT}]} -le ${#LSCT} ]]; then
		/usr/libexec/PlistBuddy -c "Set LSHandlers:${idx}:LSHandlerRoleAll com.google.chrome" ${PLIST}
	fi;
end
