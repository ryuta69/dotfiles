tell application "System Preferences"
	activate
	reveal pane id "com.apple.preference.general"
end tell
tell application "System Events"
	tell application process "System Preferences"
		repeat while not (window 1 exists)
		end repeat
		tell window "General"
			tell pop up button 3
				delay 1
				click
				tell menu 1
					click menu item "Google Chrome.app"
				end tell
			end tell
		end tell
	end tell
end tell
quit application "System Preferences"