-- set docklist to {
-- 	"com.apple.mail", "file:///Applications/Mail.app/", 15, "Mail",
-- 	"com.docker.docker", "file:///Applications/Docker.app/", 15, "Docker",
-- 	"com.apple.AppStore", "file:///Applications/App%20Store.app/", 15, "App Store",
-- 	"com.apple.dt.Xcode", "file:///Applications/Xcode.app/", 15, "Xcode",
-- 	"com.amazon.Kindle", "file:///Applications/Kindle.app/", 15, "Kindle",
-- 	"com.microsoft.VSCode", "file:///Applications/Visual%20Studio%20Code.app/", 15, "Visual Studio Code",
-- 	"us.zoom.xos", "file:///Applications/zoom.us.app/", 15, "zoom.us",
-- 	"com.hnc.Discord", "file:///Applications/Discord.app/", 15, "Discord",
-- 	"com.panic.Transmit", "file:///Applications/Transmit.app/", 15, "Transmit",
-- 	"org.virtualbox.app.VirtualBox", "file:///Applications/VirtualBox.app/", 15, "VirtualBox",
-- 	"com.apple.QuickTimePlayerX", "file:///Applications/QuickTime%20Player.app/", 15, "QuickTime Player",
-- 	"com.evernote.Evernote", "file:///Applications/Evernote.app/", 15, "Evernote",
-- 	"com.mongodb.compass", "file:///Applications/MongoDB%20Compass.app/", 15, "MongoDB Compass",
-- 	"com.google.android.studio", "file:///Applications/Android%20Studio.app/", 15, "Android Studio",
-- 	"jp.naver.line.mac", "file:///Applications/LINE.app/", 15, "LINE",
-- 	"com.getflywheel.lightning.local", "file:///Applications/Local.app/", 15, "Local",
-- 	"com.sequelpro.SequelPro", "file:///Applications/Sequel%20Pro.app/", 15, "Sequel Pro",
-- 	"com.tinyspeck.slackmacgap", "file:///Applications/Slack.app/", 15, "Slack",
-- 	"com.apple.iCal", "file:///Applications/Calendar.app/", 15, "Calendar",
-- 	"com.postmanlabs.mac", "file:///Applications/Postman.app/", 15, "Postman",
-- 	"com.google.Chrome", "file:///Applications/Google%20Chrome.app/", 15, "Google Chrome",
-- 	"com.adobe.xd", "file:///Applications/Adobe%20XD/Adobe%20XD.app/", 15, "Adobe XD",
-- 	"com.apple.DigitalColorMeter", "file:///Applications/Utilities/Digital%20Color%20Meter.app/", 15, "Digital Color Meter",
-- 	"com.apple.VoiceMemos", "file:///Applications/VoiceMemos.app/", 15, "Voice Memos",
-- 	"com.runningwithcrayons.Alfred-Preferences", "file:///Applications/Alfred%204.app/Contents/Preferences/Alfred%20Preferences.app/", 15, "Alfred Preferences",
-- 	"com.googlecode.iterm2", "file:///Applications/iTerm.app/", 15, "iTerm",
-- 	"com.apple.Automator", "file:///Applications/Automator.app/", 15, "Automator",
-- 	"com.apple.systempreferences", "file:///Applications/System%20Preferences.app/", 15, "System Preferences"
-- }

-- Applescript allow only one line array.
set docklist to { "com.apple.mail", "file:///Applications/Mail.app/", 15, "Mail", "com.docker.docker", "file:///Applications/Docker.app/", 15, "Docker", "com.apple.AppStore", "file:///Applications/App%20Store.app/", 15, "App Store", "com.apple.dt.Xcode", "file:///Applications/Xcode.app/", 15, "Xcode", "com.amazon.Kindle", "file:///Applications/Kindle.app/", 15, "Kindle", "com.microsoft.VSCode", "file:///Applications/Visual%20Studio%20Code.app/", 15, "Visual Studio Code", "us.zoom.xos", "file:///Applications/zoom.us.app/", 15, "zoom.us", "com.hnc.Discord", "file:///Applications/Discord.app/", 15, "Discord", "com.panic.Transmit", "file:///Applications/Transmit.app/", 15, "Transmit", "org.virtualbox.app.VirtualBox", "file:///Applications/VirtualBox.app/", 15, "VirtualBox", "com.apple.QuickTimePlayerX", "file:///Applications/QuickTime%20Player.app/", 15, "QuickTime Player", "com.evernote.Evernote", "file:///Applications/Evernote.app/", 15, "Evernote", "com.mongodb.compass", "file:///Applications/MongoDB%20Compass.app/", 15, "MongoDB Compass", "com.google.android.studio", "file:///Applications/Android%20Studio.app/", 15, "Android Studio", "jp.naver.line.mac", "file:///Applications/LINE.app/", 15, "LINE", "com.getflywheel.lightning.local", "file:///Applications/Local.app/", 15, "Local", "com.sequelpro.SequelPro", "file:///Applications/Sequel%20Pro.app/", 15, "Sequel Pro", "com.tinyspeck.slackmacgap", "file:///Applications/Slack.app/", 15, "Slack", "com.apple.iCal", "file:///Applications/Calendar.app/", 15, "Calendar", "com.postmanlabs.mac", "file:///Applications/Postman.app/", 15, "Postman", "com.google.Chrome", "file:///Applications/Google%20Chrome.app/", 15, "Google Chrome", "com.adobe.xd", "file:///Applications/Adobe%20XD/Adobe%20XD.app/", 15, "Adobe XD", "com.apple.DigitalColorMeter", "file:///Applications/Utilities/Digital%20Color%20Meter.app/", 15, "Digital Color Meter", "com.apple.VoiceMemos", "file:///Applications/VoiceMemos.app/", 15, "Voice Memos", "com.runningwithcrayons.Alfred-Preferences", "file:///Applications/Alfred%204.app/Contents/Preferences/Alfred%20Preferences.app/", 15, "Alfred Preferences", "com.googlecode.iterm2", "file:///Applications/iTerm.app/", 15, "iTerm", "com.apple.Automator", "file:///Applications/Automator.app/", 15, "Automator", "com.apple.systempreferences", "file:///Applications/System%20Preferences.app/", 15, "System Preferences" }

set counter to 1
set docksize to the length of docklist
do shell script "echo " & (docksize)

try
	tell application "Dock" to quit
end try
repeat while counter > docksize
	set item_id   to item counter + 0 of docklist
	set item_path to item counter + 1 of docklist
	set item_type to item counter + 2 of docklist
	set item_name to item counter + 3 of docklist

	do shell script "defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>bundle-identifier</key><string>" & item_id & "</string><key>file-data</key><dict><key>_CFURLString</key><string>" & item_path & "</string><key>_CFURLStringType</key><integer>" & item_type & "</integer></dict><key>file-label</key><string>" & item_name & "</string></dict></dict>'"

  	set counter to counter + 4
end repeat
try
	tell application "Dock" to activate
end try
