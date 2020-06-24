#! /bin/bash

EXEPATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)

## ----------------------------------------
##	System Preferences
## ----------------------------------------
General() {
	# ========== Apprerance ==========
	# - Light
	# defaults delete .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically
	# defaults delete .GlobalPreferences AppleInterfaceStyle > /dev/null 2>&1
	# - Dark
	defaults delete .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically
	defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"
	# - Auto
	# defaults write .GlobalPreferences AppleInterfaceStyleSwitchesAutomatically -bool true

	# ========== Accent color ==========
	# - Blue
	defaults delete .GlobalPreferences AppleAccentColor > /dev/null 2>&1
	# - Purple
	# defaults write .GlobalPreferences AppleAccentColor -int 5
	# - Pink
	# defaults write .GlobalPreferences AppleAccentColor -int 6
	# - Red
	# defaults write .GlobalPreferences AppleAccentColor -int 0
	# - Orange
	# defaults write .GlobalPreferences AppleAccentColor -int 1
	# - Yellow
	# defaults write .GlobalPreferences AppleAccentColor -int 2
	# - Green
	# defaults write .GlobalPreferences AppleAccentColor -int 3
	# - Grphite
	# defaults write .GlobalPreferences AppleAccentColor -string "-1"

	# ========== Highlight color ==========
	# - Blue
	defaults delete .GlobalPreferences AppleHighlightColor > /dev/null 2>&1
	# - Purple
	# defaults write .GlobalPreferences AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"
	# - Pink
	# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.749020 0.823529 Pink"
	# - Red
	# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.733333 0.721569 Red"
	# - Orange
	# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.874510 0.701961 Orange"
	# - Yellow
	# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.937255 0.690196 Yellow"
	# - Green
	# defaults write .GlobalPreferences AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"
	# - Grphite
	# defaults write .GlobalPreferences AppleHighlightColor -string "0.847059 0.847059 0.862745 Graphite"
	# - Other
	# defaults write .GlobalPreferences AppleHighlightColor -string "Your NSColor"

	# ========== Sidebar icon size ==========
	# - Small
	defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 1
	# - Medium
	# defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 2
	# - Large
	# defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 3

	# ========== Automatically hide and show the menu bar ==========
	# - Checked
	defaults write .GlobalPreferences _HIHideMenuBar -bool true
	# - Unchecked
	# defaults write .GlobalPreferences _HIHideMenuBar -bool false

	# ========== Show scroll bars ==========
	# - Automatically based on mouse or trackpad
	defaults write .GlobalPreferences AppleShowScrollBars -string "Automatic"
	# - When scrolling
	# defaults write .GlobalPreferences AppleShowScrollBars -string "WhenScrolling"
	# - Always
	# defaults write .GlobalPreferences AppleShowScrollBars -string "Always"

	# ========== Click in the scroll bar to ==========
	# - Jump to the next page
	# defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool false
	# - Jump to the spot that's clicked
	defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool true

	# ========== Default web browser ==========
	# - Google Chrome
	LSSC=("http" "https" "mailto")
	LSCT=("public.xhtml" "public.html")
	PLIST="${HOME}/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist"
	HNUM=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:" ${PLIST} | grep -P '^[\s]*Dict' | wc -l | tr -d ' ')
	for idx in $(seq 0 $(expr ${HNUM} - 1)); do
	        THIS_LSSC=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:${idx}:LSHandlerURLScheme" ${PLIST} 2>/dev/null)
	        if [[ ${LSSC[@]} =~ $THIS_LSSC ]]; then
	                /usr/libexec/PlistBuddy -c "Set LSHandlers:${idx}:LSHandlerRoleAll com.google.chrome" ${PLIST}
	        fi

	        THIS_LSCT=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:${idx}:LSHandlerContentType" ${PLIST} 2>/dev/null)
	        if [[ ${LSCT[@]} =~ $THIS_LSCT ]]; then
	                /usr/libexec/PlistBuddy -c "Set LSHandlers:${idx}:LSHandlerRoleAll com.google.chrome" ${PLIST}
	        fi
	done

	# ========== Ask to keep changes when closing documents ==========
	# - Checked
	# defaults write .GlobalPreferences NSCloseAlwaysConfirmsChanges -bool true
	# - Unchecked
	defaults write .GlobalPreferences NSCloseAlwaysConfirmsChanges -bool false

	# ========== Close windows when quitting an app ==========
	# - Checked
	# defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool false
	# - Unchecked
	defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool true

	# ========== Recent items ==========
	# - None
	# - 5
	# - 10
	# - 15
	# @string: choose preferred item.
	osascript -e "
		tell application \"System Preferences\"
			activate
			set current pane to pane \"com.apple.preference.general\"
		end tell
		tell application \"System Events\"
			tell application process \"System Preferences\"
				repeat while not (window 1 exists)
				end repeat
				tell window 1
					tell pop up button 4
						delay 1
						click
						tell menu 1
							click menu item \"None\"
						end tell
					end tell
				end tell
			end tell
		end tell
	"

	# ========== Allow Handoff between this Mac and your iCloud devices ==========
	# - Checked
	# defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool true
	# defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool true
	# - Unchecked
	defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool false
	defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool false

	# ========== Use font smoothing when available ==========
	# - Checked
	defaults -currentHost delete .GlobalPreferences AppleFontSmoothing
	# - Unchecked
	# defaults -currentHost write .GlobalPreferences AppleFontSmoothing -bool false
}

DesktopScreenSaver() {
	# ========== Desktop Picture ==========
	osascript -e "
		tell application \"Finder\"
			set desktop picture to \"${EXEPATH}/img/desktop.png\" as POSIX file
		end tell
	"

	# ========== desktop ==========
	# - Fill Screen
	# - Fit to Screen
	# - Streach to Fill Screen
	# - Center
	# - Tile
	# @string: choose preferred item.
	osascript -e "
		tell application \"System Preferences\"
			activate
			reveal pane id \"com.apple.preference.desktopscreeneffect\"
		end tell
		tell application \"System Events\"
			tell application process \"System Preferences\"
				repeat while not (window 1 exists)
				end repeat
				tell window 1
					tell tab group 1
						tell pop up button 2
							click
							delay 1
							tell menu 1
								click menu item \"Fill Screen\"
							end tell
						end tell
					end tell
				end tell
			end tell
		end tell
	"

	# ========== ScreenSaver Picture ==========
	osascript -e "
		tell application \"System Preferences\"
			activate
			reveal pane id \"com.apple.preference.desktopscreeneffect\"
		end tell
		tell application \"System Events\"
			tell application process \"System Preferences\"
				repeat while not (window 1 exists)
				end repeat
				tell window 1
					tell tab group 1
						repeat with current_group in list 1 of list 1 of scroll area 1
							if name of image of current_group is equal to \"Message\" then
								click image of current_group
								every UI element
							end if
						end repeat
					end tell
				end tell
			end tell
		end tell
	"

	# ========== Start After ==========
	# @int: seconds
	defaults -currentHost write com.apple.screensaver idleTime -int 0

	# ========== Show with clock ==========
	# - Checked
	# defaults -currentHost write com.apple.screensaver showClock -bool true
	# - Unchecked
	defaults -currentHost delete com.apple.screensaver showClock

	# ========== Use random screen saver ==========
	# - Checked
	# SPLIST=$(ls ~/Library/Preferences/ByHost/com.apple.screensaver*)
	# /usr/libexec/PlistBuddy \
	# 	-c "Add moduleDict dict" \
	# 	-c "Add moduleDict:moduleName string Random" \
	# 	-c "Add moduleDict:path string /System/Library/Screen\ Savers/Random.saver" \
	# 	-c "Add moduleDict:type integer 8" \
	# 	${SPLIST}
	# - Unchecked
	defaults -currentHost delete com.apple.screensaver moduleDict
}

Dock() {
	# ========== Size ==========
	# @int: size
	defaults write com.apple.dock tilesize -int 30

	# ========== Magnification ==========
	# - Checked
	# defaults write com.apple.dock magnification -bool true
	# - Unchecked
	defaults delete com.apple.dock magnification

	# ========== `Magnification` Bar ==========
	# @int: size
	# defaults write com.apple.dock largesize -int 128

	# ========== Position on screen ==========
	# - Left
	defaults write com.apple.dock orientation -string "left"
	# - Bottom
	# defaults delete com.apple.dock orientation
	# - Right
	# defaults write com.apple.dock orientation -string "right"

	# ========== Minimize windows using ==========
	# - Genie effect
	# defaults write com.apple.dock mineffect -string "genie"
	# - Scale effect
	defaults write com.apple.dock mineffect -string "scale"

	# ========== Prefer tabs when opening documents ==========
	# - Always
	defaults write .GlobalPreferences AppleWindowTabbingMode -string "always"
	# - In Full Screen Only
	# defaults write .GlobalPreferences AppleWindowTabbingMode -string "fullscreen"
	# - Manually
	# defaults write .GlobalPreferences AppleWindowTabbingMode -string "manual"

	# ========== Double-click a window's title bar to ==========
	# - Checked
	# `Double-click a window's title bar to` pop up menu
	#	- minimize
	defaults write .GlobalPreferences AppleActionOnDoubleClick -string "Minimize"
	#	- zoom
	# defaults write .GlobalPreferences AppleActionOnDoubleClick -string "Maximize"
	# - Unchecked
	# defaults write .GlobalPreferences AppleActionOnDoubleClick -string "None"

	# ========== Minimize windows into application icon ==========
	# - Checked
	defaults write com.apple.dock minimize-to-application -bool true
	# - Unchecked
	# defaults write com.apple.dock minimize-to-application -bool false

	# ========== Animate opening applications ==========
	# - Checked
	# defaults write com.apple.dock launchanim -bool true
	# - Unchecked
	defaults write com.apple.dock launchanim -bool false

	# ========== Automatically hide and show the Dock ==========
	# - Checked
	defaults write com.apple.dock autohide -bool true
	# - Unchecked
	# defaults delete com.apple.dock autohide

	# ========== Show indicators for open applications ==========
	# - Checked
	defaults write com.apple.dock show-process-indicators -bool true
	# - Unchecked
	# defaults write com.apple.dock show-process-indicators -bool false

	# ========== Show recent applications in Dock ==========
	# - Checked
	# defaults write com.apple.dock show-recents -bool true
	# - Unchecked
	defaults write com.apple.dock show-recents -bool false
}

MissionControl() {
	# ========== Automatically rearrange Spaces based on most recent use ==========
	# - Checked
	# defaults write com.apple.dock mru-spaces -bool true
	# - Unchecked
	defaults write com.apple.dock mru-spaces -bool false

	# ========== When switching to an application, switch to a Space with open windows for the application ==========
	# - Checked
	defaults write .GlobalPreferences AppleSpacesSwitchOnActivate -bool true
	# - Unchecked
	# defaults write .GlobalPreferences AppleSpacesSwitchOnActivate -bool false

	# ========== Group windows by application ==========
	# - Checked
	defaults write com.apple.dock expose-group-apps -bool true
	# - Unchecked
	# defaults write com.apple.dock expose-group-apps -bool false

	# ========== Displays have separate Spaces ==========
	# - Checked
	defaults write com.apple.spaces spans-displays -bool true
	# - Unchecked
	# defaults write com.apple.spaces spans-displays -bool false

	# ========== Dashboard ==========
	# - Off
	defaults write com.apple.dashboard db-enabled-state -int 1
	# - As Space
	# defaults write com.apple.dashboard db-enabled-state -int 2
	# - As Overlay
	# defaults write com.apple.dashboard db-enabled-state -int 3
}

Siri() {
	# ========== Enable Adk Siri ==========
	# - Checked
	# defaults write com.apple.assistant.support.plist Assistant Enabled -bool true
	# - Unchecked
	defaults write com.apple.assistant.support.plist "Assistant Enabled" -bool false

	# ========== Show Siri in menu bar ==========
	# - Checked
	# defaults write com.apple.Siri StatusMenuVisible -bool true
	# - Unchecked
	defaults write com.apple.Siri StatusMenuVisible -bool false
}

Spotlight() {
	# ========== Search Results ==========
	defaults delete com.apple.Spotlight orderedItems
	SCAT=(
		# Applications
		"APPLICATIONS"               true
		# Bookmarks & History
		"BOOKMARKS"                  true
		# Calculator
		"MENU_EXPRESSION"            true
		# Contacts
		"CONTACT"                    true
		# Conversion
		"MENU_CONVERSION"            true
		# Conversion
		"MENU_DEFINITION"            true
		# Developer
		"SOURCE"                     true
		# Documents
		"DOCUMENTS"                  true
		# Events & Reminders
		"EVENT_TODO"                 true
		# Folders
		"DIRECTORIES"                true
		# Fonts
		"FONTS"                      true
		# Images
		"IMAGES"                     true
		# Mail & Messages
		"MESSAGES"                   true
		# Movies
		"MOVIES"                     true
		# Music
		"MUSIC"                      true
		# Other
		"MENU_OTHER"                 true
		# PDF Documents
		"PDF"                        true
		# Presentations
		"PRESENTATIONS"              true
		# Spreadsheets
		"SPREADSHEETS"               true
		# Spotlight Suggestions
		"MENU_SPOTLIGHT_SUGGESTIONS" true
		# System Preferences
		"SYSTEM_PREFS"               true
	)
	SNUM=$(expr $# / 2)
	PLIST="${HOME}/Library/Preferences/com.apple.Spotlight"
	/usr/libexec/PlistBuddy -c "Add orderedItems array" ${PLIST}
	for idx in $(seq 0 $(expr ${HNUM} - 1)); do
		CATN=${SCAT[$(( ${idx} * 2     ))]}
		CATB=${SCAT[$(( ${idx} * 2 + 1 ))]}

		/usr/libexec/PlistBuddy \
			-c "Add persistent-apps:${idx} dict" \
			-c "Add persistent-apps:${idx}:enabled bool ${CATB}" \
			-c "Add persistent-apps:${idx}:name string ${CATN}" \
			${PLIST}
	done

	# ========== Allow Spotlight Suggestions in Look up ==========
	# - Checked
	defaults write com.apple.lookup.shared LookupSuggestionsDisabled -bool true
	# - Unchecked
	# defaults write com.apple.lookup.shared LookupSuggestionsDisabled -bool false
}

LanguageRegion() {
	# ========== Preferred languages ==========
	# @string: languages abbreviation
	defaults write .GlobalPreferences AppleLanguages -array en ja

	# ========== Region ==========
	# - Japan
	defaults write .GlobalPreferences AppleMetricUnits -int 1
	defaults write .GlobalPreferences AppleLocale -string "en-JP"
	defaults write .GlobalPreferences AppleMeasurementUnits -string "Centimeters"
	# - United States
	# defaults write .GlobalPreferences AppleMetricUnits -int 0
	# defaults write .GlobalPreferences AppleLocale -string "en-US"
	# defaults write .GlobalPreferences AppleMeasurementUnits -string "Inches"

	# ========== First day of week ==========
	# - Sunday
	# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 1
	# - Monday
	defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 2
	# - Tuesday
	# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 3
	# - Wednesday
	# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 4
	# - Thursday
	# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 5
	# - Friday
	# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 6
	# - Saturday
	# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 7

	# ========== Calendar ==========
	ALOCAL=$(defaults read .GlobalPreferences AppleLocale | awk -F '@' '{print $1}')
	# - Gregorian
	# defaults write .GlobalPreferences AppleLocale -string ${ALOCAL}
	# - Japanese
	defaults write .GlobalPreferences AppleLocale -string ${ALOCAL}"@calendar=japanese"

	# ========== Time format: 24-Hour Time ==========
	# - Checked
	defaults delete .GlobalPreferences AppleICUForce12HourTime
	# - Unchecked
	# defaults write .GlobalPreferences AppleICUForce12HourTime -bool true

	# ========== Temperature ==========
	# - Celsius
	defaults write .GlobalPreferences AppleTemperatureUnit -string "Celsius"
	# - Fahrenheit
	# defaults write .GlobalPreferences AppleTemperatureUnit -string "Fahrenheit"

	# ========== List sort order ==========
	# - Universal
	defaults delete .GlobalPreferences AppleCollationOrder
	# - Japanese
	# defaults write .GlobalPreferences AppleCollationOrder -string "ja"
	# - Japanese (Radical-Stroke Sort Order)
	# defaults write .GlobalPreferences AppleCollationOrder -string "ja@collation=unihan"
}

Notifications() {
	# ========== From: ==========
	# - Checked
	#	- params: Hours devided by 60 from 0:00. 1319 is 23-59.
	defaults -currentHost write com.apple.notificationcenterui dndStart -int 0
	# - Unchecked
	# defaults -currentHost delete com.apple.notificationcenterui dndStart

	# ========== to: ==========
	# - Checked
	#	- params: Hours devided by 60 from 0:00. 1319 is 23-59.
	defaults -currentHost write com.apple.notificationcenterui dndEnd -int 1319
	# - Unchecked
	# defaults -currentHost delete com.apple.notificationcenterui dndEnd

	# ========== When the display is sleeping ==========
	# - Checked
	defaults -currentHost write com.apple.notificationcenterui dndEnabledDisplaySleep -bool true
	# - Unchecked
	# defaults -currentHost delete com.apple.notificationcenterui dndEnabledDisplaySleep

	# ========== When mirroring to TVs and projectors ==========
	# - Checked
	defaults -currentHost delete com.apple.notificationcenterui dndMirroring
	# - Unchecked
	# defaults -currentHost write com.apple.notificationcenterui dndMirroring -bool false

	# ========== Allow calls from everyone ==========
	# - Checked
	# defaults -currentHost write com.apple.notificationcenterui dndFacetime -bool true
	# - Unchecked
	defaults -currentHost delete com.apple.notificationcenterui dndFacetime

	# ========== Allow repeated calls ==========
	# - Checked
	# defaults -currentHost write com.apple.notificationcenterui dndFacetime -bool true
	# defaults -currentHost write com.apple.notificationcenterui dndFacetimeRepeatedCalls -bool true
	# - Unchecked
	defaults -currentHost delete com.apple.notificationcenterui dndFacetime
	defaults -currentHost delete com.apple.notificationcenterui dndFacetimeRepeatedCalls
}

UsersGroups() {
	# ========== Profile Picture ==========
	UNM=$(whoami)
	sudo dscl . create /Users/${UNM} Picture "${EXEPATH}/img/icon.jpeg"
}

SecurityPrivacy() {
	# ========== Require password ~ after sleep or screen saver begins ==========
	# - Checked
	# @int: seconds
	defaults write com.apple.screensaver askForPassword -bool true
	defaults write com.apple.screensaver askForPasswordDelay -int 0
	# - Unchecked
	# defaults write com.apple.screensaver askForPassword -bool false

	# !!!!! This should not be set !!!!!
	# sudo spctl --master-disable
}

SoftwareUpdate() {
	# ========== Automatically keep my Mac up to date ==========
	# @int: how many times a week
	defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 0
}

Network() {
	# ========== Show Wi-Fi status in menu bar ==========
	# - Checked
	IS_AIRPORT=$(defaults read com.apple.systemuiserver menuExtras | grep "AirPort")
	[[ -z ${IS_AIRPORT} ]] && /usr/libexec/PlistBuddy -c "Add menuExtras \"/System/Library/CoreServices/Menu Extras/AirPort.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
	# - Unchecked
	# IS_AIRPORT=$(defaults read com.apple.systemuiserver menuExtras | grep "AirPort")
	# [[ -n ${IS_AIRPORT} ]] && /usr/libexec/PlistBuddy -c "Delete menuExtras:\"/System/Library/CoreServices/Menu Extras/AirPort.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
}

Bluetooth() {
	# ========== Show Bluetooth status in menu bar ==========
	# - Checked
	IS_BLUETOOTH=$(defaults read com.apple.systemuiserver menuExtras | grep "Bluetooth")
	[[ -z ${IS_BLUETOOTH} ]] && /usr/libexec/PlistBuddy -c "Add menuExtras \"/System/Library/CoreServices/Menu Extras/Bluetooth.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
	# - Unchecked
	# IS_BLUETOOTH=$(defaults read com.apple.systemuiserver menuExtras | grep "Bluetooth")
	# [[ -n ${IS_BLUETOOTH} ]] && /usr/libexec/PlistBuddy -c "Delete menuExtras:\"/System/Library/CoreServices/Menu Extras/Bluetooth.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
}

Sound() {
	# ========== Show Volume status in menu bar ==========
	# - Checked
	IS_VOLUME=$(defaults read com.apple.systemuiserver menuExtras | grep "Volume")
	[[ -z ${IS_VOLUME} ]] && /usr/libexec/PlistBuddy -c "Add menuExtras \"/System/Library/CoreServices/Menu Extras/Volume.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
	# - Unchecked
	# IS_VOLUME=$(defaults read com.apple.systemuiserver menuExtras | grep "Volume")
	# [[ -n ${IS_VOLUME} ]] && /usr/libexec/PlistBuddy -c "Delete menuExtras:\"/System/Library/CoreServices/Menu Extras/Volume.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
}

Displays() {
	# ========== Resolution ==========
	# Resolution
	# - Default for display
	# - Scaled
	#	- Larger Text
	# 	- Second Larger Text
	# 	- Middle
	# 	- Default
	# 	- More Space
	osascript -e "
		tell application \"System Preferences\"
		        activate
		        reveal anchor \"displaysDisplayTab\" of pane id \"com.apple.preference.displays\"
		end tell
		tell application \"System Events\"
		        delay 0.5
		        tell application process \"System Preferences\" to tell window \"Built-in Retina Display\"
		                click radio button \"Scaled\" of radio group 1 of tab group 1
		                click radio button 4 of radio group 1 of group 2 of tab group 1
		                delay 0.5
		                try
		                        click button \"OK\" of sheet 1
		                end try
		        end tell
		end tell
	"

	# ========== Show mirroring options in the menu bar when available ==========
	# - Checked
	# defaults write com.apple.airplay showInMenuBarIfPresent -bool true
	# defaults write com.apple.airplay "NSStatusItem Visible com.apple.menuextra.airplay" -bool true
	# - Unchecked
	defaults write com.apple.airplay showInMenuBarIfPresent -bool false
	defaults write com.apple.airplay "NSStatusItem Visible com.apple.menuextra.airplay" -bool false

	# ========== Brightness ==========
	# @int: 1.Lightest 0.Darkest
	brightness 1

	# ========== Nightshift Schedule ==========
	NPLIST="/private/var/root/Library/Preferences/com.apple.CoreBrightness.plist"
	currentUUID=$(dscl . -read /Users/$(whoami)/ GeneratedUID | cut -d' ' -f2)
	currentUUID="CBUser-${currentUserUID}"
	# - Off
	# /usr/libexec/PlistBuddy -c "Set :${currentUserUID}:CBBlueReductionStatus:AutoBlueReductionEnabled 0" ${NPLIST}
	# - Custom
	/usr/libexec/PlistBuddy \
		-c "Set :${currentUserUID}:CBBlueReductionStatus:BlueReductionEnabled 1" \ 
		-c "Set :${currentUserUID}:CBBlueReductionStatus:BlueLightReductionSchedule:DayStartHour 23" \ 
		-c "Set :${currentUserUID}:CBBlueReductionStatus:BlueLightReductionSchedule:DayStartMinute 59" \ 
		-c "Set :${currentUserUID}:CBBlueReductionStatus:BlueLightReductionSchedule:NightStartHour 0" \ 
		-c "Set :${currentUserUID}:CBBlueReductionStatus:BlueLightReductionSchedule:NightStartMinute 0" \ 
		${NPLIST}
	# - Sunset to Sunrise
	# /usr/libexec/PlistBuddy -c "Set :${currentUserUID}:CBBlueReductionStatus:AutoBlueReductionEnabled 1" ${NPLIST}

	# Color Temperature
	# @int: warmest.2700 coldest.6000
	/usr/libexec/PlistBuddy -c "Set :${currentUserUID}:CBBlueLightReductionCCTTargetRaw 2700" ${NPLIST}
}

EnergySaver() {
	# ========== Show Battery status in menu bar ==========
	# - Checked
	IS_BATTERY=$(defaults read com.apple.systemuiserver menuExtras | grep "Battery")
	[[ -z ${IS_BATTERY} ]] && /usr/libexec/PlistBuddy -c "Add menuExtras \"/System/Library/CoreServices/Menu Extras/Battery.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
	# - Unchecked
	# IS_BATTERY=$(defaults read com.apple.systemuiserver menuExtras | grep "Battery")
	# [[ -n ${IS_BATTERY} ]] && /usr/libexec/PlistBuddy -c "Delete menuExtras:\"/System/Library/CoreServices/Menu Extras/Battery.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist

	# ========== Turn display off after ==========
	# @int: minutes
	sudo pmset -b displaysleep 3

	# ========== Put hard disks to sleep when possible ==========
	# - Checked
	sudo pmset -b disksleep 1
	# - Unchecked
	# sudo pmset -b disksleep 0

	# ========== Slightly dim the display while on battery power ==========
	# - Checked
	# sudo pmset -b lessbright 0
	# - Unchecked
	sudo pmset -b lessbright 0

	# ========== Enable Power Nap while on battery power ==========
	# - Checked
	# sudo pmset -b powernap 1
	# - Unchecked
	sudo pmset -b powernap 0

	# ========== Turn display off after ==========
	# @int: minutes
	sudo pmset -c displaysleep 3

	# ========== Prevent computer from sleeping automatically when the display is off ==========
	sudo pmset -c sleep 0

	# ========== Put hard disks to sleep when possible ==========
	# - Checked
	# sudo pmset -c disksleep 1
	# - Unchecked
	sudo pmset -c disksleep 0

	# ========== Wake for Wi-Fi network access ==========
	# - Checked
	sudo pmset -c womp 1
	# - Unchecked
	# sudo pmset -c womp 0

	# ========== Enable Power Nap while plugged into a power adapter ==========
	# - Checked
	# sudo pmset -c powernap 1
	# - Unchecked
	sudo pmset -c powernap 0
}

DateTime() {
	# ========== Set date and time automatically ==========
	# - Checked
	sudo systemsetup -setusingnetworktime on > /dev/null
	# - Unchecked
	# sudo systemsetup -setusingnetworktime off > /dev/null

	# ========== Show date and time in menu bar ==========
	# - Checked
	IS_CLOCK=$(defaults read com.apple.systemuiserver menuExtras | grep "Clock")
	[[ -z ${IS_CLOCK} ]] && /usr/libexec/PlistBuddy -c "Add menuExtras \"/System/Library/CoreServices/Menu Extras/Clock.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
	# - Unchecked
	# IS_CLOCK=$(defaults read com.apple.systemuiserver menuExtras | grep "Clock")
	# [[ -n ${IS_CLOCK} ]] && /usr/libexec/PlistBuddy -c "Delete menuExtras:\"/System/Library/CoreServices/Menu Extras/Clock.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist

	# ========== Time options ==========
	# - Digital
	defaults write com.apple.menuextra.clock IsAnalog -bool false
	# - Analog
	# defaults write com.apple.menuextra.clock IsAnalog -bool true

	# ========== Display the time with seconds ==========
	# - Checked
	# defaults write com.apple.menuextra.clock DateFormat -string "HH:mm:ss"
	# - Unchecked
	defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"

	# ========== Flash the time separators ==========
	# - Checked
	# defaults write com.apple.menuextra.clock FlashDateSeparators -bool true
	# - Unchecked
	defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

	# ========== Use a 24-hour clock ==========
	# - Checked
	defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"
	# - Unchecked
	# defaults write com.apple.menuextra.clock DateFormat -string "H:mm"

	# ========== Show AM/PM ==========
	# - Checked
	# defaults write com.apple.menuextra.clock DateFormat -string "H:mm"
	# - Unchecked
	defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"

	# ========== Show the day of the week ==========
	# - Checked
	# defaults write com.apple.menuextra.clock DateFormat -string "EEE HH:mm"
	# - Unchecked
	defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"

	# ========== Show date ==========
	# - Checked
	# defaults write com.apple.menuextra.clock DateFormat -string "MMM d EEE HH:mm"
	# - Unchecked
	defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"
}

iCloud() {
	# Disable All settings
	defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool FALSE
}

TimeMachine() {
	# ========== Back Up Automatically ==========
	# - Checked
	# sudo tmutil enable
	# - Unchecked
	sudo tmutil disable

	# ========== Show Time Machine in menu bar ==========
	# - Checked
	# IS_TIMEMACHINE=$(defaults read com.apple.systemuiserver menuExtras | grep "TimeMachine")
	# [[ -z ${IS_TIMEMACHINE} ]] && /usr/libexec/PlistBuddy -c "Add menuExtras \"/System/Library/CoreServices/Menu Extras/TimeMachine.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
	# - Unchecked
	IS_TIMEMACHINE=$(defaults read com.apple.systemuiserver menuExtras | grep "TimeMachine")
	[[ -n ${IS_TIMEMACHINE} ]] && /usr/libexec/PlistBuddy -c "Delete menuExtras:\"/System/Library/CoreServices/Menu Extras/TimeMachine.menu\"" ${HOME}/Library/Preferences/com.apple.systemuiserver.plist
}

Keyboard() {
	## <Tab> Keyboard
	# Key Repeat
	# params: 15 is the fastest
	defaults write .GlobalPreferences InitialKeyRepeat -int 10

	# Delay Until Repeat
	# params: 2 is the fastest
	defaults write .GlobalPreferences KeyRepeat -int 1

	# Adjust keyboard brightness in low light
	# [ToDo]

	# Turn keyboard backlight off after ~~~ of inactivity
	# [ToDo]

	# `Turn keyboard backlight off after ~~~ of inactivity` seconds
	# [ToDo]

	# Touch Bar shows
	# [ToDo] Check if there is command to touchbar exists
	# - App Control
	# - Expanded Control Strip
	osascript <<EOF
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
EOF
	# - F1, F2, etc. Keys
	# - Quick Actions


	# Press Fn key to
	# - App Control
	# - Expanded Control Strip
	# - F1, F2, etc. Keys
	# - Quick Actions
	# [ToDo]

	# Show keyboard and emoji viewers in menu bar
	# [ToDo]

	# Use F1, F2, etx. keys as standard function keys on external keyboards
	# [ToDo]

	# <Button> Modifier Keys
	# Select keyboard
	# [ToDo]

	# Caps Lock Key
	# [ToDo]

	# Control Key
	# [ToDo]

	# Option Key
	# [ToDo]

	# Command Key
	# [ToDo]

	# Function Key
	# [ToDo]

	## <Tab> Text
	# Correct spelling automatically
	# [ToDo]

	# Capitalize words automatically
	# [ToDo]

	# Add period with double-space
	# [ToDo]

	# Touch Bar typing suggestions
	# [ToDo]

	# Use smart quotes and dashes
	# - Checked
	# defaults write .GlobalPreferences NSAutomaticDashSubstitutionEnabled -bool true
	# defaults write .GlobalPreferences NSAutomaticQuoteSubstitutionEnabled -bool true
	# - Unchecked
	defaults write .GlobalPreferences NSAutomaticDashSubstitutionEnabled -bool false
	defaults write .GlobalPreferences NSAutomaticQuoteSubstitutionEnabled -bool false

	## <Tab> Shortcuts
	# Full Keyboard Access
	# - Text boxes and lists only
	# - All controls
	# [ToDo]

	## <Menu> Launchpad & Dock
	# Turn Dock Hiding On/Off
	# [ToDo]

	# Show Launchpad
	# [ToDo]

	## <Menu> Display
	# Decrease display brightness
	# [ToDo]

	# Increase display brightness
	# [ToDo]

	## <Menu> Mission Control
	# Mission Control
	# [ToDo]

	# Show Notification Center
	# [ToDo]

	# Turn Do Not Disturb On/Off
	# [ToDo]

	# Application windows
	# [ToDo]

	# Show Desktop
	# [ToDo]

	# Show Dashboard
	# [ToDo]

	# Move left a space
	# [ToDo]

	# Move right a space
	# [ToDo]

	# Switch to Desktop 1
	# [ToDo]

	## <Menu> Keyboard
	# Change the way Tab moves focus
	# [ToDo]

	# Turn keyboard access on or off
	# [ToDo]

	# Move focus to the menu bar
	# [ToDo]

	# Move focus to the Dock
	# [ToDo]

	# Move focus to active or next window
	# [ToDo]

	# Move focus to the window toolbar
	# [ToDo]

	# Move focus to the floating window
	# [ToDo]

	# Move focus to next window
	# [ToDo]

	# Move focus to the window drawer
	# [ToDo]

	# Move focus to status menus
	# [ToDo]

	## <Menu> Input Sources
	# Select the previous input source
	# Select next source in Input menu
	osascript <<EOF
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
	                if value of static text 1 of current_row is equal to "Input Sources" then
	                        select current_row
	                        exit repeat
	                end if
	        end repeat

	        repeat while not (rows of outline 1 of scroll area 2 of splitter group 1 of tab group 1 exists)
	        end repeat

	        repeat with current_row in rows of outline 1 of scroll area 2 of splitter group 1 of tab group 1
	                if name of UI element 2 of current_row is equal to "Select next source in input menu" then
	                        select current_row
	                        click checkbox of UI element 1 of current_row
	                        exit repeat
	                end if
	        end repeat

	        end tell
	        end tell
	end tell
EOF

	## <Menu> Screenshots
	# Save picture of screen as a file
	# [ToDo]

	# Copy picture of screen to the clipboard
	# [ToDo]

	# Save picture of selected area as a file
	# [ToDo]

	# Copy picture of sel...area to the clipboard
	# [ToDo]

	# Screenshot and recording options
	# [ToDo]

	# Save picture of the Touch Bar as a file
	# [ToDo]

	# Copy picture of the...Bar to the clipboard
	# [ToDo]

	## <Menu> Services

	## <Menu> Spotlight
	# Show Spotlight search
	osascript <<EOF
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
EOF

	# Show Finder search window
	# [ToDo]

	## <Menu> Accessibility

	## <Menu> App Shortcuts
	# Show Help menu
	# [ToDo]

	## <Menu> Function Keys

	## <Tab> Input Sources
	Add Input Sources
	GJIME=$(defaults read com.apple.HIToolbox AppleEnabledInputSources | grep "InputSourceKind = \"Keyboard Input Method\"")
	[[ -z  ${GJIME} ]] && osascript <<EOF
	set addcmd to "<dict><key>Bundle ID</key><string>com.google.inputmethod.Japanese</string><key>InputSourceKind</key><string>Keyboard Input Method</string></dict>"

	do shell script "defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '" & addcmd & "'"
EOF

	# Show Input menu in menu bar
	# [ToDo]

	# Automatically switch to a document's input source
	# [ToDo]

	## <Tab> Dictation
	# Dictation
	# [ToDo]

	# Use Enhanced Dictation
	# [ToDo]

	# Language
	# [ToDo]

	# Shortcut
	# [ToDo]
}

Trackpad() {
	## <Tab> Point & Click
	# Look up & data detectors
	# [ToDo]

	# `Look up & data detectors` pop up menu
	# - Force Click with one finger
	# - Tap with Three fingers
	# [ToDo]

	# Secondary click
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

	# `Secondary click` pop up menu
	# - Click or tap with two fingers
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick 1
	# - Click in bottom right corner
	# - Click in bottom left corner

	# Tap to click
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

	# Click
	defaults write -g com.apple.trackpad.forceClick 2

	# Tracking speed
	defaults write -g com.apple.trackpad.scaling 3

	# Force Click and haptic feedback
	# [ToDo]

	## <Tab> Scroll & Zoom
	# Scroll direction: Natural
	# [ToDo]

	# Zoom in or out
	# [ToDo]

	# Smart zoom
	# [ToDo]

	# Rotate
	# [ToDo]

	## <Tab> More Gestures
	# Swipe between pages
	# [ToDo]

	# `Swipe between pages` pop up menu
	# - Scroll left or right with two fingers
	# - Swipe with three fingers
	# - Swipe with two or three fingers
	# [ToDo]

	# Swipe between full-screen apps
	# [ToDo]

	# `Swipe between full-screen apps` pop up menu
	# - Scroll left or right with three fingers
	# - Scroll left or right with four fingers
	# [ToDo]

	# Notification Center
	# [ToDo]

	# Mission Control
	# [ToDo]

	# `Mission Control` pop up menu
	# - Swipe up with three fingers
	# - Swipe up with four fingers
	# [ToDo]

	# App Expose
	# [ToDo]

	# `App Expose` pop up menu
	# - Swipe down with three fingers
	# - Swipe down with four fingers
	# [ToDo]

	# Launchpad
	# [ToDo]

	# Show Desktop
	# [ToDo]
}
## ----------------------------------------
##	Finder
## ----------------------------------------
Finder() {
	## ========== General ==========
	# Show these items on the desktop
	# Hard disks
	# - Checked
	# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
	# - Unchecked
	defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
	# External disks
	# - Checked
	# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
	# - Unchecked
	defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
	# CDs, DVDs, and iPods
	# - Checked
	# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
	# - Unchecked
	defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
	# Connected servers
	# - Checked
	# defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
	# - Unchecked
	defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

	# New Finder windows show
	defaults write com.apple.finder NewWindowTarget -string "${HOME}/work"

	# Open folders in tabs instead of new windows
	# - Checked
	defaults write com.apple.finder FinderSpawnTab -bool true
	# - Unchecked
	# defaults write com.apple.finder FinderSpawnTab -bool false

	## ========== Tags ==========
	# Show these tags in the sidebar
	# [ToDo]

	## ========== Sidebar ==========
	# Favorite
	# [ToDo]

	# Locations
	# [ToDo]

	# Tags
	# Recent Tags
	# - Checked
	# defaults write com.apple.finder ShowRecentTags -bool true
	# - Unchecked
	defaults write com.apple.finder ShowRecentTags -bool false

	## ========== Advanced ==========
	# Show all filename extensions
	defaults write -g AppleShowAllExtensions -bool true

	# Show warning before changing an extension
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

	# Show warning before removing from iCloud Drive
	defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

	# Show warning before emptying the Trash
	defaults write com.apple.finder WarnOnEmptyTrash -bool false

	# Remove items from the Trash after 30 days
	defaults write com.apple.finder FXRemoveOldTrashItems -bool true

	# Keep folders on top
	# - In windows when sorting by name
	defaults write com.apple.finder _FXSortFoldersFirst -bool false
	# - On Desktop

	# When Performing a search
	# - Search This Mac
	defaults write com.apple.finder FXDefaultSearchScope -string "SCev"
	# - Search the Current Folder
	# - Use the Previous Search Scope

	## ========== Right Click ==========
	# View
	# - as Icons
	# - as List
	# - as Columns
	defaults write com.apple.Finder FXPreferredViewStyle Nlsv
	# - as Gallary View

	# Use Groups
	# [ToDo]

	# SortBy
	# - Name
	# - Kind
	# - Date Last Opened
	# - Date Added
	# - Date Modified
	# - Date Created
	# - Size
	# - Tags
	# [ToDo]

	# <Button> View Options
	# Icon Size
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 36" ${HOME}/Library/Preferences/com.apple.finder.plist

	# Grid Spacing
	# [ToDo]

	# Text Size
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" ${HOME}/Library/Preferences/com.apple.finder.plist

	# Label Position
	# - Bottom
	# - Right
	# [ToDo]

	# Show Item Info
	# [ToDo]

	# Show Icons
	# [ToDo]

	# Show Icon Preview
	# [ToDo]

	# Show Column Preview
	# [ToDo]

	## ========== View ==========
	# [ToDo] false version
	# Show Toolbar
	defaults write com.apple.finder ShowSidebar -bool true
	defaults write com.apple.finder ShowPreviewPane -bool true
	# Show Path Bar
	defaults write com.apple.finder ShowPathbar -bool true
	# Show Tab Bar
	defaults write com.apple.finder ShowTabView -bool true
	# Show Status Bar
	defaults write com.apple.finder ShowStatusBar -bool true
}

## ----------------------------------------
##	Desktop
## ----------------------------------------
Desktop() {
	## ==========  Right Click ==========
	# Stack By
	# - Kind
	# - Date Last Opened
	# - Date Added
	# - Date Modified
	# - Date Created
	# - Tags
	# [ToDo]

	# SortBy
	# - Name
	# - Kind
	# - Date Last Opened
	# - Date Added
	# - Date Modified
	# - Date Created
	# - Size
	# - Tags
	# [ToDo]

	# Icon Size
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 36" ${HOME}/Library/Preferences/com.apple.finder.plist

	# Text Size
	/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" ${HOME}/Library/Preferences/com.apple.finder.plist

	# Grid Spacing
	# [ToDo]

	# Show Item Info
	# [ToDo]

	# Show Icon Preview
	# [ToDo]
}

## ----------------------------------------
##	Extra
## ----------------------------------------
ExtraSettings() {
	## ========== Dock Applications ==========
	defaults delete com.apple.dock persistent-apps
	# dockitem=(
	# 	"Mail"                "com.apple.mail"                            "file:///Applications/Mail.app/"
	# 	"Docker"              "com.docker.docker"                         "file:///Applications/Docker.app/"
	# 	"App Store"           "com.apple.AppStore"                        "file:///Applications/App%20Store.app/"
	# 	"Xcode"               "com.apple.dt.Xcode"                        "file:///Applications/Xcode.app/"
	# 	"Kindle"              "com.amazon.Kindle"                         "file:///Applications/Kindle.app/"
	# 	"Rectangle"           "com.knollsoft.Rectangle"                   "file:///Applications/Rectangle.app/"
	# 	"Visual Studio Code"  "com.microsoft.VSCode"                      "file:///Applications/Visual%20Studio%20Code.app/"
	# 	"zoom.us"             "us.zoom.xos"                               "file:///Applications/zoom.us.app/"
	# 	"Wireshark"           "org.wireshark.Wireshark"                   "file:///Applications/Wireshark.app/"
	# 	"Discord"             "com.hnc.Discord"                           "file:///Applications/Discord.app/"
	# 	"Transmit"            "com.panic.Transmit"                        "file:///Applications/Transmit.app/"
	# 	"VirtualBox"          "org.virtualbox.app.VirtualBox"             "file:///Applications/VirtualBox.app/"
	# 	"QuickTime Player"    "com.apple.QuickTimePlayerX"                "file:///Applications/QuickTime%20Player.app/"
	# 	"MongoDB Compass"     "com.mongodb.compass"                       "file:///Applications/MongoDB%20Compass.app/"
	# 	"LimeChat"            "net.limechat.LimeChat-AppStore"            "file:///Applications/LimeChat.app/"
	# 	"Android Studio"      "com.google.android.studio"                 "file:///Applications/Android%20Studio.app/"
	# 	"LINE"                "jp.naver.line.mac"                         "file:///Applications/LINE.app/"
	# 	"Local"               "com.getflywheel.lightning.local"           "file:///Applications/Local.app/"
	# 	"Sequel Pro"          "com.sequelpro.SequelPro"                   "file:///Applications/Sequel%20Pro.app/"
	# 	"Slack"               "com.tinyspeck.slackmacgap"                 "file:///Applications/Slack.app/"
	# 	"Calendar"            "com.apple.iCal"                            "file:///Applications/Calendar.app/"
	# 	"Burp Suite"          "com.install4j.9806-1938-4586-6531.70"      "file:///Applications/Burp%20Suite%20Community%20Edition.app/"
	# 	"Postman"             "com.postmanlabs.mac"                       "file:///Applications/Postman.app/"
	# 	"Google Chrome"       "com.google.Chrome"                         "file:///Applications/Google%20Chrome.app/"
	# 	"Adobe XD"            "com.adobe.xd"                              "file:///Applications/Adobe%20XD/Adobe%20XD.app/"
	# 	"Skitch"              "com.skitch.skitch"                         "file:///Applications/Skitch.app/"
	# 	"Voice Memos"         "com.apple.VoiceMemos"                      "file:///Applications/VoiceMemos.app/"
	# 	"Gifski"              "com.sindresorhus.Gifski"                   "file:///Applications/Gifski.app/"
	# 	"Alfred Preferences"  "com.runningwithcrayons.Alfred-Preferences" "file:///Applications/Alfred%204.app/Contents/Preferences/Alfred%20Preferences.app/"
	# 	"Tor Browser"         "org.torproject.torbrowser"                 "file:///Applications/Tor%20Browser.app/"
	# 	"iTerm"               "com.googlecode.iterm2"                     "file:///Applications/iTerm.app/"
	# 	"Karabiner-Elements"  "org.pqrs.Karabiner-Elements.Preferences"   "file:///Applications/Karabiner-Elements.app/"
	# 	"Automator"           "com.apple.Automator"                       "file:///Applications/Automator.app/"
	# 	"Digital Color Meter" "com.apple.DigitalColorMeter"               "file:///Applications/Utilities/Digital%20Color%20Meter.app/"
	# 	"GPG Keychain"        "org.gpgtools.gpgkeychain"                  "file:///Applications/GPG%20Keychain.app/"
	# 	"System Preferences"  "com.apple.systempreferences"               "file:///Applications/System%20Preferences.app/"
	# 	"Script Editor"       "com.apple.ScriptEditor2"                   "file:///Applications/Utilities/Script%20Editor.app/"
	# 	"Notion"              "notion.id"                                 "file:///Applications/Notion.app/"
	# )
	# PLIST="${HOME}/Library/Preferences/com.apple.dock.plist"
	# /usr/libexec/PlistBuddy -c "Add persistent-apps array" ${PLIST}
	# DNUM=$(expr ${dockitem[(I)$dockitem[-1]]} / 3)
	# for idx in $(seq 0 $(expr ${HNUM} - 1)); do
	# 	NAMEIDX=${dockitem[$(( ${idx} * 3 + 1 ))]}
	# 	ITEMIDX=${dockitem[$(( ${idx} * 3 + 2 ))]}
	# 	PATHIDX=${dockitem[$(( ${idx} * 3 + 3 ))]}

	# 	/usr/libexec/PlistBuddy \
	# 		-c "Add persistent-apps:${idx} dict" \
	# 		-c "Add persistent-apps:${idx}:tile-data dict" \
	# 		-c "Add persistent-apps:${idx}:tile-data:file-label string ${NAMEIDX}" \
	# 		-c "Add persistent-apps:${idx}:tile-data:bundle-identifier string ${ITEMIDX}" \
	# 		-c "Add persistent-apps:${idx}:tile-data:file-data dict" \
	# 		-c "Add persistent-apps:${idx}:tile-data:file-data:_CFURLString string ${PATHIDX}" \
	# 		-c "Add persistent-apps:${idx}:tile-data:file-data:_CFURLStringType integer 15" \
	# 		${PLIST}
	# done
	killall cfprefsd
	killall Dock

	## ========== Default Application ==========

	# Editor - TextEdit
	LSCT=("public.json" "com.netscape.javascript-source")
	PLIST="${HOME}/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist"
	HNUM=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:" ${PLIST} | grep -P '^[\s]*Dict' | wc -l | tr -d ' ')
	for idx in $(seq 0 $(expr ${HNUM} - 1)); do
		THIS_LSCT=$(/usr/libexec/PlistBuddy -c "Print LSHandlers:${idx}:LSHandlerContentType" ${PLIST} 2>/dev/null)
		if [[ ${LSCT[@]} =~ $THIS_LSCT ]]; then
			/usr/libexec/PlistBuddy -c "Set LSHandlers:${idx}:LSHandlerRoleAll com.apple.textedit" ${PLIST}
		fi;
	done

	## ========== Remove Notification ==========
	defaults write com.apple.LaunchServices LSQuarantine -bool false

	## ========== Disable DS_STORE in Network and USB ==========
	defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

	## ========== Show Hidden Files ==========
	defaults write com.apple.finder AppleShowAllFiles true

	## ========== Show Directory Details ==========
	defaults write com.apple.finder ShowPathbar -bool true
	defaults write com.apple.finder ShowStatusBar -bool true
	defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

	## ========== Disable System Preferences Red Bubble Notification ==========
	defaults write com.apple.systempreferences AttentionPrefBundleIDs 0

	## ========== Crash Reporter to be in Notification but Popup Window ==========
	defaults write com.apple.CrashReporter UseUNC 1

	## ========== Speed up Window Resize Animation ==========
	defaults write -g NSWindowResizeTime -float 0.001

	## ========== Disable Animation in Finder ==========
	defaults write com.apple.finder DisableAllAnimations -bool true

	## ========== Disable Dock ==========
	defaults write com.apple.dock autohide-delay -float 1000
	defaults write com.apple.dock no-bouncing -bool TRUE
}

## ----------------------------------------
##	Main
## ----------------------------------------
General
DesktopScreenSaver
Dock
MissionControl
Siri
LanguageRegion
SecurityPrivacy
Spotlight
Notifications
Displays
EnergySaver
Keyboard
Trackpad
Sound
SoftwareUpdate
Network
Bluetooth
UsersGroups
DateTime
iCloud
TimeMachine
Finder
Desktop
ExtraSettings
