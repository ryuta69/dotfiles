tell application "System Preferences"
	activate
	reveal pane id "com.apple.preference.general"
end tell
tell application "System Events"
	tell application process "System Preferences"
		repeat while not (window 1 exists)
		end repeat
		tell window "General" of application process "System Preferences" of application "System Events"
			tell pop up button 3 of window "General" of application process "System Preferences" of application "System Events"
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