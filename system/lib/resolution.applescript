tell application "System Preferences"
	activate
	reveal anchor "displaysDisplayTab" of pane id "com.apple.preference.displays"
end tell
tell application "System Events"
	delay 0.5
	tell application process "System Preferences" to tell window "Built-in Retina Display"
		click radio button "Scaled" of radio group 1 of tab group 1
		click radio button 4 of radio group 1 of group 2 of tab group 1
		delay 0.5
		try
			click button "OK" of sheet 1
		end try
	end tell
end tell
quit application "System Preferences"
