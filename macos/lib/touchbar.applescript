tell application "System Preferences"
    	activate
    	set current pane to pane id "com.apple.preference.keyboard"
	tell application "System Events"
    		delay 0.5
    		tell application process "System Preferences" to tell window "Keyboard"




		end tell
	end tell
end tell
quit application "System Preferences"
