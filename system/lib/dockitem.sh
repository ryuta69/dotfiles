#! /bin/bash

defaults delete com.apple.dock persistent-apps

dockitem=(
	"Mail"                "com.apple.mail"                            "file:///Applications/Mail.app/"
	"Docker"              "com.docker.docker"                         "file:///Applications/Docker.app/"
	"App Store"           "com.apple.AppStore"                        "file:///Applications/App%20Store.app/"
	"Xcode"               "com.apple.dt.Xcode"                        "file:///Applications/Xcode.app/"
	"Kindle"              "com.amazon.Kindle"                         "file:///Applications/Kindle.app/"
	"Rectangle"           "com.knollsoft.Rectangle"                   "file:///Applications/Rectangle.app/"
	"Visual Studio Code"  "com.microsoft.VSCode"                      "file:///Applications/Visual%20Studio%20Code.app/"
	"zoom.us"             "us.zoom.xos"                               "file:///Applications/zoom.us.app/"
	"Wireshark"           "org.wireshark.Wireshark"                   "file:///Applications/Wireshark.app/"
	"Discord"             "com.hnc.Discord"                           "file:///Applications/Discord.app/"
	"Transmit"            "com.panic.Transmit"                        "file:///Applications/Transmit.app/"
	"VirtualBox"          "org.virtualbox.app.VirtualBox"             "file:///Applications/VirtualBox.app/"
	"QuickTime Player"    "com.apple.QuickTimePlayerX"                "file:///Applications/QuickTime%20Player.app/"
	"MongoDB Compass"     "com.mongodb.compass"                       "file:///Applications/MongoDB%20Compass.app/"
	"Android Studio"      "com.google.android.studio"                 "file:///Applications/Android%20Studio.app/"
	"LINE"                "jp.naver.line.mac"                         "file:///Applications/LINE.app/"
	"Local"               "com.getflywheel.lightning.local"           "file:///Applications/Local.app/"
	"Sequel Pro"          "com.sequelpro.SequelPro"                   "file:///Applications/Sequel%20Pro.app/"
	"Slack"               "com.tinyspeck.slackmacgap"                 "file:///Applications/Slack.app/"
	"Calendar"            "com.apple.iCal"                            "file:///Applications/Calendar.app/"
	"Burp Suite"          "com.install4j.9806-1938-4586-6531.70"      "file:///Applications/Burp%20Suite%20Community%20Edition.app/"
	"Postman"             "com.postmanlabs.mac"                       "file:///Applications/Postman.app/"
	"Google Chrome"       "com.google.Chrome"                         "file:///Applications/Google%20Chrome.app/"
	"Adobe XD"            "com.adobe.xd"                              "file:///Applications/Adobe%20XD/Adobe%20XD.app/"
	"Skitch"              "com.skitch.skitch"                         "file:///Applications/Skitch.app/"
	"Voice Memos"         "com.apple.VoiceMemos"                      "file:///Applications/VoiceMemos.app/"
	"Gifski"              "com.sindresorhus.Gifski"                   "file:///Applications/Gifski.app/"
	"Alfred Preferences"  "com.runningwithcrayons.Alfred-Preferences" "file:///Applications/Alfred%204.app/Contents/Preferences/Alfred%20Preferences.app/"
	"Tor Browser"         "org.torproject.torbrowser"                 "file:///Applications/Tor%20Browser.app/"
	"iTerm"               "com.googlecode.iterm2"                     "file:///Applications/iTerm.app/"
	"Karabiner-Elements"  "org.pqrs.Karabiner-Elements.Preferences"   "file:///Applications/Karabiner-Elements.app/"
	"Automator"           "com.apple.Automator"                       "file:///Applications/Automator.app/"
	"Digital Color Meter" "com.apple.DigitalColorMeter"               "file:///Applications/Utilities/Digital%20Color%20Meter.app/"
	"GPG Keychain"        "org.gpgtools.gpgkeychain"                  "file:///Applications/GPG%20Keychain.app/"
	"System Preferences"  "com.apple.systempreferences"               "file:///Applications/System%20Preferences.app/"
	"Script Editor"       "com.apple.ScriptEditor2"                   "file:///Applications/Utilities/Script%20Editor.app/"
	"Notion"              "notion.id"                                 "file:///Applications/Notion.app/"
)

PLIST="${HOME}/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-apps array" ${PLIST}

DNUM=$(expr ${dockitem[(I)$dockitem[-1]]} / 3)
for idx in $(seq 0 $(expr ${HNUM} - 1)); do
	NAMEIDX=${dockitem[$(( ${idx} * 3 + 1 ))]}
	ITEMIDX=${dockitem[$(( ${idx} * 3 + 2 ))]}
	PATHIDX=${dockitem[$(( ${idx} * 3 + 3 ))]}

	/usr/libexec/PlistBuddy \
		-c "Add persistent-apps:${idx} dict" \
		-c "Add persistent-apps:${idx}:tile-data dict" \
		-c "Add persistent-apps:${idx}:tile-data:file-label string ${NAMEIDX}" \
		-c "Add persistent-apps:${idx}:tile-data:bundle-identifier string ${ITEMIDX}" \
		-c "Add persistent-apps:${idx}:tile-data:file-data dict" \
		-c "Add persistent-apps:${idx}:tile-data:file-data:_CFURLString string ${PATHIDX}" \
		-c "Add persistent-apps:${idx}:tile-data:file-data:_CFURLStringType integer 15" \
		${PLIST}
done

killall cfprefsd
killall Dock
