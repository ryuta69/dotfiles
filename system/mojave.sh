#! /bin/bash

EXEPATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)

## ----------------------------------------
##	System Preferences
## ----------------------------------------
## ========== General ==========
# Apprerance
# 1: Light
# defaults delete .GlobalPreferences AppleInterfaceStyle > /dev/null 2>&1
# 2: Dark
defaults write .GlobalPreferences AppleInterfaceStyle -string "Dark"

# Accent color
# 1: Blue
defaults delete .GlobalPreferences AppleAccentColor > /dev/null 2>&1
# 2: Purple
# defaults write .GlobalPreferences AppleAccentColor -int 5
# 3: Pink
# defaults write .GlobalPreferences AppleAccentColor -int 6
# 4: Red
# defaults write .GlobalPreferences AppleAccentColor -int 0
# 5: Orange
# defaults write .GlobalPreferences AppleAccentColor -int 1
# 6: Yellow
# defaults write .GlobalPreferences AppleAccentColor -int 2
# 7: Green
# defaults write .GlobalPreferences AppleAccentColor -int 3
# 8: Grphite
# defaults write .GlobalPreferences AppleAccentColor -string "-1"

# Highlight color
# 1: Blue
defaults delete .GlobalPreferences AppleHighlightColor > /dev/null 2>&1
# 2: Purple
# defaults write .GlobalPreferences AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"
# 3: Pink
# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.749020 0.823529 Pink"
# 4: Red
# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.733333 0.721569 Red"
# 5: Orange
# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.874510 0.701961 Orange"
# 6: Yellow
# defaults write .GlobalPreferences AppleHighlightColor -string "1.000000 0.937255 0.690196 Yellow"
# 7: Green
# defaults write .GlobalPreferences AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"
# 8: Grphite
# defaults write .GlobalPreferences AppleHighlightColor -string "0.847059 0.847059 0.862745 Graphite"
# 9: Other
# defaults write .GlobalPreferences AppleHighlightColor -string "Your NSColor"

# Sidebar icon size
# 1: Small
defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 1
# 2: Medium
# defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 2
# 3: Large
# defaults write .GlobalPreferences NSTableViewDefaultSizeMode -int 3

# Automatically hide and show the menu bar
# 1: Checked
# defaults write .GlobalPreferences _HIHideMenuBar -bool true
# 2: Unchecked
defaults write .GlobalPreferences _HIHideMenuBar -bool false

# Show scroll bars
# 1: Automatically based on mouse or trackpad
defaults write .GlobalPreferences AppleShowScrollBars -string "Automatic"
# 2: When scrolling
# defaults write .GlobalPreferences AppleShowScrollBars -string "WhenScrolling"
# 3: Always
# defaults write .GlobalPreferences AppleShowScrollBars -string "Always"

# Click in the scroll bar to
# 1: Jump to the next page
# defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool false
# 2: Jump to the spot that's clicked
defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool true

# Default web browser
# 1: Google Chrome
# Defined in Default Application

# Ask to keep changes when closing documents
# 1: Checked
# defaults write .GlobalPreferences NSCloseAlwaysConfirmsChanges -bool true
# 2: Unchecked
defaults write .GlobalPreferences NSCloseAlwaysConfirmsChanges -bool false

# Close windows when quitting an app
# 1: Checked
# defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool false
# 2: Unchecked
defaults write .GlobalPreferences NSQuitAlwaysKeepsWindows -bool true

# Recent items
# [ToDo] sfl2

# Allow Handoff between this Mac and your iCloud devices
# 1: Checked
# defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool true
# defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool true
# 2: Unchecked
defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool false
defaults -currentHost write com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool false

# Use font smoothing when available
# 1: Checked
defaults -currentHost delete .GlobalPreferences AppleFontSmoothing
# 2: Unchecked
# defaults -currentHost write .GlobalPreferences AppleFontSmoothing -bool false

## ========== Desktop & Screen Saver ==========
## <Tab> Desktop
# Desktop Picture
osascript -e "tell application \"Finder\" to set desktop picture to \"${EXEPATH}/img/desktop.png\" as POSIX file"

# `DesktopPicture` pop up menu
# 1: Fill Screen
# 2: Fit to Screen
# 3: Streach to Fill Screen
# 4: Center
# 5: Tile
# [ToDo] sfl2

# Change picture
# [ToDo] sfl2

# `Change picture` pop up menu
# 1: When logging in
# 2: When waking from sleep
# 3: Every ~ seconds/minutes
# 4: Random order(active when `Change picture is set`)
# [ToDo] sfl2

## <Tab> Screen Saver
# Start After
# int: seconds
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Show with clock
# 1: Checked
# defaults -currentHost write com.apple.screensaver showClock -bool true
# 2: Unchecked
defaults -currentHost delete com.apple.screensaver showClock

# Use random screen saver
# 1: Checked
defaults -currentHost delete com.apple.screensaver moduleDict
# 2: Unchecked
# SPLIST=$(ls ~/Library/Preferences/ByHost/com.apple.screensaver*)
# /usr/libexec/PlistBuddy \
# 	-c "Add moduleDict dict" \
# 	-c "Add moduleDict:moduleName string Random" \
# 	-c "Add moduleDict:path string /System/Library/Screen\ Savers/Random.saver" \
# 	-c "Add moduleDict:type integer 8" \
# 	${SPLIST}

## ========== Dock ==========
# Size
defaults write com.apple.dock tilesize -int 30

# Magnification
# 1: Checked
# defaults write com.apple.dock magnification -bool true
# 2: Unchecked
defaults delete com.apple.dock magnification

# `Magnification` Bar
# defaults write com.apple.dock largesize -int 128

# Position on screen
# 1: Left
defaults write com.apple.dock orientation -string "left"
# 2: Bottom
# defaults delete com.apple.dock orientation
# 3: Right
# defaults write com.apple.dock orientation -string "right"

# Minimize windows using
# 1: Genie effect
# defaults write com.apple.dock mineffect -string "genie"
# 2: Scale effect
defaults write com.apple.dock mineffect -string "scale"

# Prefer tabs when opening documents
# 1: Always
defaults write .GlobalPreferences AppleWindowTabbingMode -string "always"
# 2: In Full Screen Only
# defaults write .GlobalPreferences AppleWindowTabbingMode -string "fullscreen"
# 3: Manually
# defaults write .GlobalPreferences AppleWindowTabbingMode -string "manual"

# Double-click a window's title bar to
# 1: Checked
# `Double-click a window's title bar to` pop up menu
# 1-1: minimize
defaults write .GlobalPreferences AppleActionOnDoubleClick -string "Minimize"
# 1-2: zoom
# defaults write .GlobalPreferences AppleActionOnDoubleClick -string "Maximize"
# 2: Unchecked
# defaults write .GlobalPreferences AppleActionOnDoubleClick -string "None"

# Minimize windows into application icon
# 1: Checked
defaults write com.apple.dock minimize-to-application -bool true
# 2: Unchecked
# defaults write com.apple.dock minimize-to-application -bool false

# Animate opening applications
# 1: Checked
# defaults write com.apple.dock launchanim -bool true
# 2: Unchecked
defaults write com.apple.dock launchanim -bool false

# Automatically hide and show the Dock
# 1: Checked
defaults write com.apple.dock autohide -bool true
# 2: Unchecked
# defaults delete com.apple.dock autohide

# Show indicators for open applications
# 1: Checked
defaults write com.apple.dock show-process-indicators -bool true
# 2: Unchecked
# defaults write com.apple.dock show-process-indicators -bool false

# Show recent applications in Dock
# 1: Checked
# defaults write com.apple.dock show-recents -bool true
# 2: Unchecked
defaults write com.apple.dock show-recents -bool false

## ========== Mission Control ==========
# Automatically rearrange Spaces based on most recent use
# 1: Checked
# defaults write com.apple.dock mru-spaces -bool true
# 2: Unchecked
defaults write com.apple.dock mru-spaces -bool false

# When switching to an application, switch to a Space with open windows for the application
# 1: Checked
defaults write .GlobalPreferences AppleSpacesSwitchOnActivate -bool true
# 2: Unchecked
# defaults write .GlobalPreferences AppleSpacesSwitchOnActivate -bool false

# Group windows by application
# 1: Checked
defaults write com.apple.dock expose-group-apps -bool true
# 2: Unchecked
# defaults write com.apple.dock expose-group-apps -bool false

# Displays have separate Spaces
# 1: Checked
defaults write com.apple.spaces spans-displays -bool true
# 2: Unchecked
# defaults write com.apple.spaces spans-displays -bool false

# Dashboard
# 1: Off
defaults write com.apple.dashboard db-enabled-state -int 1
# 2: As Space
# defaults write com.apple.dashboard db-enabled-state -int 2
# 3: As Overlay
# defaults write com.apple.dashboard db-enabled-state -int 3

## <Section> Keyboard and Mouse Shortcuts
# => Write in Keyboard Shorcut Section.

## ========== Language & Region ==========
# Preferred languages
# params: languages abbreviation
defaults write .GlobalPreferences AppleLanguages -array en ja

# Region
# 1: Japan
defaults write .GlobalPreferences AppleMetricUnits -int 1
defaults write .GlobalPreferences AppleLocale -string "en-JP"
defaults write .GlobalPreferences AppleMeasurementUnits -string "Centimeters"
# 2: United States
# defaults write .GlobalPreferences AppleMetricUnits -int 0
# defaults write .GlobalPreferences AppleLocale -string "en-US"
# defaults write .GlobalPreferences AppleMeasurementUnits -string "Inches"

# First day of week
# 1: Sunday
# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 1
# 2: Monday
defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 2
# 3: Tuesday
# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 3
# 4: Wednesday
# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 4
# 5: Thursday
# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 5
# 6: Friday
# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 6
# 7: Saturday
# defaults write .GlobalPreferences AppleFirstWeekday -dict gregorian 7

# Calendar
ALOCAL=$(defaults read .GlobalPreferences AppleLocale | awk -F '@' '{print $1}')
# 1: Gregorian
# defaults write .GlobalPreferences AppleLocale -string ${ALOCAL}
# 2: Japanese
defaults write .GlobalPreferences AppleLocale -string ${ALOCAL}"@calendar=japanese"

# Time format: 24-Hour Time
# 1: Checked
defaults delete .GlobalPreferences AppleICUForce12HourTime
# 2: Unchecked
# defaults write .GlobalPreferences AppleICUForce12HourTime -bool true

# Temperature
# 1: Celsius
defaults write .GlobalPreferences AppleTemperatureUnit -string "Celsius"
# 2: Fahrenheit
# defaults write .GlobalPreferences AppleTemperatureUnit -string "Fahrenheit"

# List sort order
# 1: Universal
defaults delete .GlobalPreferences AppleCollationOrder
# 2: Japanese
# defaults write .GlobalPreferences AppleCollationOrder -string "ja"
# 3: Japanese (Radical-Stroke Sort Order)
# defaults write .GlobalPreferences AppleCollationOrder -string "ja@collation=unihan"

## ========== Security & Privacy ==========
## <Tab> General
# Require password ~~~ after sleep or screen saver begins
# 1: Checked
defaults write com.apple.screensaver askForPassword -bool true
# 2: Unchecked
# defaults write com.apple.screensaver askForPassword -bool false

# `Require password ~~~ after sleep or screen saver begins` pop up menu
# params: seconds
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Allow apps downloaded from
#!!! This should not be automated.

## <Tab> FileVault
## <Tab> Firewall
## <Tab> Privacy
#!!! This should not be automated.

## ========== Spotlight ==========
# Search Results
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

# Allow Spotlight Suggestions in Look up
# 1: Checked
defaluts write com.apple.lookup.shared LookupSuggestionsDisabled -bool true
# 2: Unchecked
# defaluts write com.apple.lookup.shared LookupSuggestionsDisabled -bool false

## ========== Notifications ==========
## <Section> Turn on Do Not Disturb
# From to
# 1: Checked
# From
# params: Hours devided by 60 from 0:00. 1320 is 22:00.
# defaults -currentHost write com.apple.notificationcenterui dndStart -int 1320
# to
# params: Hours devided by 60 from 0:00. 420 is 7:00.
# defaults -currentHost write com.apple.notificationcenterui dndEnd -int 420
# 2: Unchecked
defaults -currentHost delete com.apple.notificationcenterui dndStart
defaults -currentHost delete com.apple.notificationcenterui dndEnd

# When the display is sleeping
# 1: Checked
defaults -currentHost write com.apple.notificationcenterui dndEnabledDisplaySleep -bool true
# 2: Unchecked
# defaults -currentHost delete com.apple.notificationcenterui dndEnabledDisplaySleep

# When mirroring to TVs and projectors
# 1: Checked
defaults -currentHost delete com.apple.notificationcenterui dndMirroring
# 2: Unchecked
# defaults -currentHost write com.apple.notificationcenterui dndMirroring -bool false

## <Section> When Do Not Distrub is
# Allow calls from everyone
# 1: Checked
# defaults -currentHost write com.apple.notificationcenterui dndFacetime -bool true
# 2: Unchecked
defaults -currentHost delete com.apple.notificationcenterui dndFacetime

# Allow repeated calls
# 1: Checked
# defaults -currentHost write com.apple.notificationcenterui dndFacetime -bool true
# defaults -currentHost write com.apple.notificationcenterui dndFacetimeRepeatedCalls -bool true
# 2: Unchecked
defaults -currentHost delete com.apple.notificationcenterui dndFacetime
defaults -currentHost delete com.apple.notificationcenterui dndFacetimeRepeatedCalls

# Notification Center sort order
# 1: Recents
# 2: Recents by App
# 3: Manually by App
# [ToDo] sfl2

## ========== Displays ==========
# Show mirroring options in the menu bar when available
# 1: Checked
defaults write com.apple.airplay showInMenuBarIfPresent -bool true
defaults write com.apple.airplay "NSStatusItem Visible com.apple.menuextra.airplay" -bool true
# 2: Unchecked
# defaults write com.apple.airplay showInMenuBarIfPresent -bool false
# defaults write com.apple.airplay "NSStatusItem Visible com.apple.menuextra.airplay" -bool false

## <Tab> Display
# Resolution
# Default for display
# `Scaled` ranged menu
# 1: Larger Text
# 2: Second Larger Text
# 3: Middle
# 4: Default
# 5: More Space
osascript <<EOF
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
EOF

# Brightness
# params: 1.lightest 0.darkest
brightness 1

# Automatically adjust brightness
# [ToDo]

## <Tab> Color
# Display profile
# [ToDo]

## <Tab> Night Shift
# Schedule
# 1: Off
# 2: Custom
# 3: Sunset to Sunrise
# [ToDo]

# `Off` Turn On Until Tomorrow
# [ToDo]

# `Custom` From
# [ToDo]

# `Custom` to
# [ToDo]

# `Custom` Turn On Until Later Today
# [ToDo]

# `Sunset to Sunrise` Turn On Until Sunrise
# [ToDo]

# Color Temperature
# [ToDo]

## ========== Energy Saver ==========
# Show battery status in menu bar
# [ToDo]

## <Tab> Battery
# Turn display off after
# params: minutes
sudo pmset -b displaysleep 3

# Put hard disks to sleep when possible
# 1: Checked
sudo pmset -b disksleep 1
# 2: Unchecked
# sudo pmset -b disksleep 0

# Slightly dim the display while on battery power
# 1: Checked
# sudo pmset -b lessbright 0
# 2: Unchecked
sudo pmset -b lessbright 0

# Enable Power Nap while on battery power
# 1: Checked
# sudo pmset -b powernap 1
# 2: Unchecked
sudo pmset -b powernap 0

## <Tab> Power Adapter
# Turn display off after
# params: minutes
sudo pmset -c displaysleep 3

# Prevent computer from sleeping automatically when the display is off
sudo pmset -c sleep 0

# Put hard disks to sleep when possible
# 1: Checked
# sudo pmset -c disksleep 1
# 2: Unchecked
sudo pmset -c disksleep 0

# Wake for Wi-Fi network access
# 1: Checked
sudo pmset -c womp 1
# 2: Unchecked
# sudo pmset -c womp 0

# Enable Power Nap while plugged into a power adapter
# 1: Checked
# sudo pmset -c powernap 1
# 2: Unchecked
sudo pmset -c powernap 0

## ========== Keyboard ==========
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
# 1: App Control
# 2: Expanded Control Strip
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
# 3: F1, F2, etc. Keys
# 4: Quick Actions


# Press Fn key to
# 1: App Control
# 2: Expanded Control Strip
# 3: F1, F2, etc. Keys
# 4: Quick Actions
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
# 1: Checked
# defaults write .GlobalPreferences NSAutomaticDashSubstitutionEnabled -bool true
# defaults write .GlobalPreferences NSAutomaticQuoteSubstitutionEnabled -bool true
# 2: Unchecked
defaults write .GlobalPreferences NSAutomaticDashSubstitutionEnabled -bool false
defaults write .GlobalPreferences NSAutomaticQuoteSubstitutionEnabled -bool false

## <Tab> Shortcuts
# Full Keyboard Access
# 1: Text boxes and lists only
# 2: All controls
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

## ========== Mouse ==========

## ========== Trackpad ==========
## <Tab> Point & Click
# Look up & data detectors
# [ToDo]

# `Look up & data detectors` pop up menu
# 1: Force Click with one finger
# 2: Tap with Three fingers
# [ToDo]

# Secondary click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# `Secondary click` pop up menu
# 1: Click or tap with two fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick 1
# 2: Click in bottom right corner
# 3: Click in bottom left corner

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
# 1: Scroll left or right with two fingers
# 2: Swipe with three fingers
# 3: Swipe with two or three fingers
# [ToDo]

# Swipe between full-screen apps
# [ToDo]

# `Swipe between full-screen apps` pop up menu
# 1: Scroll left or right with three fingers
# 2: Scroll left or right with four fingers
# [ToDo]

# Notification Center
# [ToDo]

# Mission Control
# [ToDo]

# `Mission Control` pop up menu
# 1: Swipe up with three fingers
# 2: Swipe up with four fingers
# [ToDo]

# App Expose
# [ToDo]

# `App Expose` pop up menu
# 1: Swipe down with three fingers
# 2: Swipe down with four fingers
# [ToDo]

# Launchpad
# [ToDo]

# Show Desktop
# [ToDo]

## ========== Printers & Scanners ==========

## ========== Sound ==========
# Show volume in menu bar
# [ToDo]

## <Tab> Sound Effects
# Select an alert sound
# [ToDo]

# Play user interface sound effects
# [ToDo]

# Play feedback when volume is changed
# [ToDo]

## <Tab> Output
# Balance
# [ToDo]

## <Tab> Input

## ========== Startup Disk ==========

## ========== iCloud ==========

## ========== Internet Accounts ==========

## ========== Wallet & Apple Pay ==========

## ========== Software Update ==========
# Automatically keep my Mac up to date
# [ToDo]

## <Button> Advanced
# Check for updates
# [ToDo]

# Download new updates when available
# [ToDo]

# Install macOS updates
# [ToDo]

# Install app updates from the App Store
# [ToDo]

# Install system data files and security updates
# [ToDo]

## ========== Network ==========
# Show Wi-Fi status in menu bar
# [ToDo]

## ========== Bluetooth ==========
# Show Bluetooth status in menu bar
# [ToDo]

## <Button> Advanced
# Open Bluetooth Setup Assistant at startup if no keyboard is detected
# [ToDo]

# Open Bluetooth Setup Assistant at startup if no mouse or trackpad is detected
# [ToDo]

# Allow Bluetooth devices to wake this computer
# [ToDo]

## ========== Extensions ==========

## ========== Sharing ==========

## ========== Touch ID ==========

## ========== Users & Groups ==========
# Profile Picture
UNM=$(whoami)
sudo dscl . create /Users/${UNM} Picture "${EXEPATH}/img/icon.jpeg"

## ========== Parental Controls ==========

## ========== Siri ==========
# Listen for "Hey Siri"
# [ToDo]

# Keyboard Shortcut
# [ToDo]

# Language
# [ToDo]

# Siri Voice
# [ToDo]

# Voice Feedback
# [ToDo]

# Show Siri in menu bar
# [ToDo]

## ========== Date & Time ==========
## <Tab> Date & Time
# Set date and time automatically
sudo systemsetup -setusingnetworktime on > /dev/null

## <Tab> Time Zone

## <Tab> Clock
# Show date and time in menu bar
# [ToDo]

# Time options
# 1: Digital
defaults write com.apple.menuextra.clock IsAnalog -bool false
# 2: Analog
# defaults write com.apple.menuextra.clock IsAnalog -bool true

# Display the time with seconds
# [ToDo]

# Flash the time separators
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

# Use a 24-hour clock
defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"

# Show AM/PM
# [ToDo]

# Show the day of the week
# [ToDo]

# Show date
# [ToDo]

# Announce the time
# [ToDo]

## ========== Time Machine ==========
# Back Up Automatically
# [ToDo]

# Show Time Machine in menu bar
# [ToDo]

## ========== Accessibility ==========

## ========== Profiles ==========

## ----------------------------------------
##	Finder
## ----------------------------------------
## ========== General ==========
# Show these items on the desktop
# Hard disks
# 1: Checked
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
# 2: Unchecked
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# External disks
# 1: Checked
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# 2: Unchecked
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# CDs, DVDs, and iPods
# 1: Checked
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# 2: Unchecked
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# Connected servers
# 1: Checked
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
# 2: Unchecked
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# New Finder windows show
defaults write com.apple.finder NewWindowTarget -string "${HOME}/work"

# Open folders in tabs instead of new windows
# 1: Checked
defaults write com.apple.finder FinderSpawnTab -bool true
# 2: Unchecked
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
# 1: Checked
# defaults write com.apple.finder ShowRecentTags -bool true
# 2: Unchecked
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
# 1: In windows when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool false
# 2: On Desktop

# When Performing a search
# 1: Search This Mac
defaults write com.apple.finder FXDefaultSearchScope -string "SCev"
# 2: Search the Current Folder
# 3: Use the Previous Search Scope

## ========== Right Click ==========
# View
# 1: as Icons
# 2: as List
# 3: as Columns
defaults write com.apple.Finder FXPreferredViewStyle Nlsv
# 4: as Gallary View

# Use Groups
# [ToDo]

# SortBy
# 1: Name
# 2: Kind
# 3: Date Last Opened
# 4: Date Added
# 5: Date Modified
# 6: Date Created
# 7: Size
# 8: Tags
# [ToDo]

# <Button> View Options
# Icon Size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 36" ${HOME}/Library/Preferences/com.apple.finder.plist

# Grid Spacing
# [ToDo]

# Text Size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" ${HOME}/Library/Preferences/com.apple.finder.plist

# Label Position
# 1: Bottom
# 2: Right
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

## ----------------------------------------
##	Desktop
## ----------------------------------------
## ==========  Right Click ==========

# Stack By
# 1: Kind
# 2: Date Last Opened
# 3: Date Added
# 4: Date Modified
# 5: Date Created
# 6: Tags
# [ToDo]

# SortBy
# 1: Name
# 2: Kind
# 3: Date Last Opened
# 4: Date Added
# 5: Date Modified
# 6: Date Created
# 7: Size
# 8: Tags
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

## ----------------------------------------
##	Extra
## ----------------------------------------
## ========== Dock Applications ==========
defaults delete com.apple.dock persistent-apps
dockitem=(
	"Mail"                "com.apple.mail"                            "file:///Applications/Mail.app/"
	"Docker"              "com.docker.docker"                         "file:///Applications/Docker.app/"
	"App Store"           "com.apple.AppStore"                        "file:///Applications/App%20Store.app/"
	"Xcode"               "com.apple.dt.Xcode"                        "file:///Applications/Xcode.app/"
	"Kindle"              "com.amazon.Kindle"                         "file:///Applications/Kindle.app/"
	"Rectangle"           "com.knollsoft.Rectangle"                   "file:///Applications/Rectangle.app/"
	"Visual Studio Code"  "com.microsoft.VSCode"                      "file:///Applications/Visual%20Studio%20Code.app/"
	"zoom.us"             "us.zoom.xos"                               "file:///Applications/zoom.us.app/"
	"Wireshark"           "org.wireshark.Wireshark"                   "file:///Applications/Wireshark.app/"
	"Discord"             "com.hnc.Discord"                           "file:///Applications/Discord.app/"
	"Transmit"            "com.panic.Transmit"                        "file:///Applications/Transmit.app/"
	"VirtualBox"          "org.virtualbox.app.VirtualBox"             "file:///Applications/VirtualBox.app/"
	"QuickTime Player"    "com.apple.QuickTimePlayerX"                "file:///Applications/QuickTime%20Player.app/"
	"MongoDB Compass"     "com.mongodb.compass"                       "file:///Applications/MongoDB%20Compass.app/"
	"LimeChat"            "net.limechat.LimeChat-AppStore"            "file:///Applications/LimeChat.app/"
	"Android Studio"      "com.google.android.studio"                 "file:///Applications/Android%20Studio.app/"
	"LINE"                "jp.naver.line.mac"                         "file:///Applications/LINE.app/"
	"Local"               "com.getflywheel.lightning.local"           "file:///Applications/Local.app/"
	"Sequel Pro"          "com.sequelpro.SequelPro"                   "file:///Applications/Sequel%20Pro.app/"
	"Slack"               "com.tinyspeck.slackmacgap"                 "file:///Applications/Slack.app/"
	"Calendar"            "com.apple.iCal"                            "file:///Applications/Calendar.app/"
	"Burp Suite"          "com.install4j.9806-1938-4586-6531.70"      "file:///Applications/Burp%20Suite%20Community%20Edition.app/"
	"Postman"             "com.postmanlabs.mac"                       "file:///Applications/Postman.app/"
	"Google Chrome"       "com.google.Chrome"                         "file:///Applications/Google%20Chrome.app/"
	"Adobe XD"            "com.adobe.xd"                              "file:///Applications/Adobe%20XD/Adobe%20XD.app/"
	"Skitch"              "com.skitch.skitch"                         "file:///Applications/Skitch.app/"
	"Voice Memos"         "com.apple.VoiceMemos"                      "file:///Applications/VoiceMemos.app/"
	"Gifski"              "com.sindresorhus.Gifski"                   "file:///Applications/Gifski.app/"
	"Alfred Preferences"  "com.runningwithcrayons.Alfred-Preferences" "file:///Applications/Alfred%204.app/Contents/Preferences/Alfred%20Preferences.app/"
	"Tor Browser"         "org.torproject.torbrowser"                 "file:///Applications/Tor%20Browser.app/"
	"iTerm"               "com.googlecode.iterm2"                     "file:///Applications/iTerm.app/"
	"Karabiner-Elements"  "org.pqrs.Karabiner-Elements.Preferences"   "file:///Applications/Karabiner-Elements.app/"
	"Automator"           "com.apple.Automator"                       "file:///Applications/Automator.app/"
	"Digital Color Meter" "com.apple.DigitalColorMeter"               "file:///Applications/Utilities/Digital%20Color%20Meter.app/"
	"GPG Keychain"        "org.gpgtools.gpgkeychain"                  "file:///Applications/GPG%20Keychain.app/"
	"System Preferences"  "com.apple.systempreferences"               "file:///Applications/System%20Preferences.app/"
	"Script Editor"       "com.apple.ScriptEditor2"                   "file:///Applications/Utilities/Script%20Editor.app/"
	"Notion"              "notion.id"                                 "file:///Applications/Notion.app/"
)
PLIST="${HOME}/Library/Preferences/com.apple.dock.plist"
/usr/libexec/PlistBuddy -c "Add persistent-apps array" ${PLIST}
DNUM=$(expr ${dockitem[(I)$dockitem[-1]]} / 3)
for idx in $(seq 0 $(expr ${HNUM} - 1)); do
	NAMEIDX=${dockitem[$(( ${idx} * 3 + 1 ))]}
	ITEMIDX=${dockitem[$(( ${idx} * 3 + 2 ))]}
	PATHIDX=${dockitem[$(( ${idx} * 3 + 3 ))]}

	/usr/libexec/PlistBuddy \
		-c "Add persistent-apps:${idx} dict" \
		-c "Add persistent-apps:${idx}:tile-data dict" \
		-c "Add persistent-apps:${idx}:tile-data:file-label string ${NAMEIDX}" \
		-c "Add persistent-apps:${idx}:tile-data:bundle-identifier string ${ITEMIDX}" \
		-c "Add persistent-apps:${idx}:tile-data:file-data dict" \
		-c "Add persistent-apps:${idx}:tile-data:file-data:_CFURLString string ${PATHIDX}" \
		-c "Add persistent-apps:${idx}:tile-data:file-data:_CFURLStringType integer 15" \
		${PLIST}
done
killall cfprefsd
killall Dock

## ========== Default Application ==========
# Browser - Chrome
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
