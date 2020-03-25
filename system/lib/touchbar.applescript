tell application "System Preferences"
	activate
	reveal anchor "keyboardTab" of pane id "com.apple.preference.keyboard"
end tell
tell application "System Events"
	tell application process "System Preferences"
		repeat while not (window 1 exists)
		end repeat
		tell window 1
			tell tab group 1
				tell pop up button 2
					delay 1
					click
					tell menu 1
						click menu item "Expanded Control Strip"
					end tell
				end tell
			end tell
		end tell
	end tell
end tell
quit application "System Preferences"