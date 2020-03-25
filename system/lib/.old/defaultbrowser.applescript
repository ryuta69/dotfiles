tell application "System Preferences"
	activate
	reveal pane id "com.apple.preference.general"
end tell

tell application "System Events"
	tell application process "System Preferences"
		repeat while not (window "General" exists)
		end repeat
		tell window "General"
			repeat while not (pop up button 3)
			end repeat
			tell pop up button 3
				click
				repeat while not (menu 1)
				end repeat
				tell menu 1
					click menu item "Google Chrome.app"
				end tell
			end tell
		end tell
	end tell
end tell

quit application "System Preferences"