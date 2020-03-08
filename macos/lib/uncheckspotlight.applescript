tell application "System Preferences"
	activate
	reveal anchor "shortcutsTab" of pane id "com.apple.preference.keyboard"
end tell
tell application "System Events"
	tell application process "System Preferences"
		repeat while not (window 1 exists)
		end repeat
	tell window 1

	repeat while not (rows of table 1 of scroll area 1 of splitter group 1 of tab group 1 exists)
	end repeat

	repeat with current_row in (rows of table 1 of scroll area 1 of splitter group 1 of tab group 1)
		if value of static text 1 of current_row is equal to "Spotlight" then
			select current_row
			exit repeat
		end if
	end repeat

	repeat while not (rows of outline 1 of scroll area 2 of splitter group 1 of tab group 1 exists)
	end repeat

	repeat with current_row in rows of outline 1 of scroll area 2 of splitter group 1 of tab group 1
		if name of UI element 2 of current_row is equal to "Show Spotlight search" then
			select current_row
			click checkbox of UI element 1 of current_row
			exit repeat
		end if
	end repeat

	end tell
	end tell
end tell