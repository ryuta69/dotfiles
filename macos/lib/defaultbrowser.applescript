tell application "System Preferences"
    	activate
    	set current pane to pane id "com.apple.preference.general"
	tell application "System Events"
    		delay 0.5
    		tell application process "System Preferences" to tell window "General"




		end tell
	end tell
end tell
quit application "System Preferences"
