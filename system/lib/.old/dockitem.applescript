set docklist to { { "com.apple.mail", "file:///Applications/Mail.app/", 15, "Mail" }, { "com.docker.docker", "file:///Applications/Docker.app/", 15, "Docker" }, { "com.apple.AppStore", "file:///Applications/App%20Store.app/", 15, "App Store" }, { "com.apple.dt.Xcode", "file:///Applications/Xcode.app/", 15, "Xcode" }, { "com.amazon.Kindle", "file:///Applications/Kindle.app/", 15, "Kindle" }, { "com.microsoft.VSCode", "file:///Applications/Visual%20Studio%20Code.app/", 15, "Visual Studio Code" }, { "us.zoom.xos", "file:///Applications/zoom.us.app/", 15, "zoom.us" }, { "com.hnc.Discord", "file:///Applications/Discord.app/", 15, "Discord" }, { "com.panic.Transmit", "file:///Applications/Transmit.app/", 15, "Transmit" }, { "org.virtualbox.app.VirtualBox", "file:///Applications/VirtualBox.app/", 15, "VirtualBox" }, { "com.apple.QuickTimePlayerX", "file:///Applications/QuickTime%20Player.app/", 15, "QuickTime Player" }, { "com.evernote.Evernote", "file:///Applications/Evernote.app/", 15, "Evernote" }, { "com.mongodb.compass", "file:///Applications/MongoDB%20Compass.app/", 15, "MongoDB Compass" }, { "com.google.android.studio", "file:///Applications/Android%20Studio.app/", 15, "Android Studio" }, { "jp.naver.line.mac", "file:///Applications/LINE.app/", 15, "LINE" }, { "com.getflywheel.lightning.local", "file:///Applications/Local.app/", 15, "Local" }, { "com.sequelpro.SequelPro", "file:///Applications/Sequel%20Pro.app/", 15, "Sequel Pro" }, { "com.tinyspeck.slackmacgap", "file:///Applications/Slack.app/", 15, "Slack" }, { "com.apple.iCal", "file:///Applications/Calendar.app/", 15, "Calendar" }, { "com.postmanlabs.mac", "file:///Applications/Postman.app/", 15, "Postman" }, { "com.google.Chrome", "file:///Applications/Google%20Chrome.app/", 15, "Google Chrome" }, { "com.adobe.xd", "file:///Applications/Adobe%20XD/Adobe%20XD.app/", 15, "Adobe XD" }, { "com.apple.VoiceMemos", "file:///Applications/VoiceMemos.app/", 15, "Voice Memos" }, { "com.sindresorhus.Gifski", "file:///Applications/Gifski.app/", 15, "Gifski" }, { "com.runningwithcrayons.Alfred-Preferences", "file:///Applications/Alfred%204.app/Contents/Preferences/Alfred%20Preferences.app/", 15, "Alfred Preferences" }, { "com.googlecode.iterm2", "file:///Applications/iTerm.app/", 15, "iTerm" }, { "com.apple.Automator", "file:///Applications/Automator.app/", 15, "Automator" }, { "com.apple.DigitalColorMeter", "file:///Applications/Utilities/Digital%20Color%20Meter.app/", 15, "Digital Color Meter" }, { "com.apple.systempreferences", "file:///Applications/System%20Preferences.app/", 15, "System Preferences" } }

set counter to 1
set docksize to the length of docklist

set dockcommand to ""

repeat while counter <= docksize
	set dockarray to item counter of docklist
	set item_id   to item 1 of dockarray
	set item_path to item 2 of dockarray
	set item_type to item 3 of dockarray
	set item_name to item 4 of dockarray

        set dockitem  to "defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>bundle-identifier</key><string>" & item_id & "</string><key>file-data</key><dict><key>_CFURLString</key><string>" & item_path & "</string><key>_CFURLStringType</key><integer>" & item_type & "</integer></dict><key>file-label</key><string>" & item_name & "</string></dict></dict>'; "

	set dockcommand to dockcommand & dockitem

	set counter to counter + 1
end repeat

do shell script dockcommand
