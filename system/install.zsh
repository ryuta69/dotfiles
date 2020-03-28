#! /usr/local/bin/zsh

setopt globdots
local -A opthash
zparseopts -D -A opthash -- -force -help -test

if [[ -n "${opthash[(i)--help]}" ]]; then
        echo "Add option --force to install without checking." && exit;
fi

if [[ -z "${opthash[(i)--force]}"  ]]; then
        read Ans"?Your file will be overwritten(Y/n): "
        if [[ $Ans != 'Y' ]]; then echo 'Canceled\n' && exit; fi;
fi;

EXEPATH=$0:A:h

osascript -e 'tell application "System Preferences" to quit' > /dev/null 2>&1

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
defaults write .GlobalPreferences _HIHideMenuBar -bool true

# Show scroll bars
# 1: Automatically based on mouse or trackpad
# defaults write .GlobalPreferences AppleShowScrollBars -string "Automatic"
# 2: When scrolling
# defaults write .GlobalPreferences AppleShowScrollBars -string "WhenScrolling"
# 3: Always
defaults write .GlobalPreferences AppleShowScrollBars -string "Always"

# Click in the scroll bar to
# 1: Jump to the next page
# defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool false
# 2: Jump to the spot that's clicked
defaults write .GlobalPreferences AppleScrollerPagingBehavior -bool true

# Default web browser
# 1: Google Chrome
zsh ./lib/defaultbrowser.zsh

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
# !!! not right now. MacOS changed it to sfl2 binary...

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
osascript -e "tell application \"Finder\" to set desktop picture to \"${EXEPATH}/img/wall_phone.jpg\" as POSIX file"

# `DesktopPicture` pop up menu
# 1: Fill Screen
# 2: Fit to Screen
# 3: Streach to Fill Screen
# 4: Center
# 5: Tile
# !!! not right now. MacOS changed it to sfl2 binary...

# Change picture
# !!! not right now. MacOS changed it to sfl2 binary...

# `Change picture` pop up menu
# 1: When logging in
# 2: When waking from sleep
# 3: Every ~ seconds/minutes
# 4: Random order(active when `Change picture is set`)
# !!! not right now. MacOS changed it to sfl2 binary...

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
# defaults write com.apple.dock orientation -string "left"
# 2: Bottom
defaults delete com.apple.dock orientation
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
# defaults write com.apple.dock autohide -bool true
# 2: Unchecked
defaults delete com.apple.dock autohide

# Show indicators for open applications
# 1: Checked
defaults write com.apple.dock show-process-indicators -bool true
# 2: Unchecked
defaults write com.apple.dock show-process-indicators -bool false

# Show recent applications in Dock
# 1: Checked
defaults write com.apple.dock show-recents -bool true
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
defaults write .GlobalPreferences AppleLocale -string "en-JP"
defaults write .GlobalPreferences AppleMeasurementUnits -string "Centimeters"
defaults write .GlobalPreferences AppleMetricUnits -int 1
# 2: United States
# defaults write .GlobalPreferences AppleLocale -string "en-US"
# defaults write .GlobalPreferences AppleMeasurementUnits -string "Inches"
# defaults write .GlobalPreferences AppleMetricUnits -int 0

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
defaults write .GlobalPreferences AppleLocale -string ${ALOCAL}
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
defaults write .GlobalPreferences AppleTemperatureUnit -string "Fahrenheit"

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
defaults write com.apple.screensaver askForPassword -bool false

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

# Allow Spotlight Suggestions in Look up

## ========== Notifications ==========
## <Section> Turn of Do Not Disturb
# From

# to

# When the display is sleeping

# When mirroring to TVs and projectors

## <Section> When Do Not Distrub is
# Allow calls from everyone

# Allow repeated calls

# Notification Center sort order
# 1: Recents
# 2: Recents by App
# 3: Manually by App

## ========== Displays ==========
# AirPlay Display

# Show mirroring options in the menu bar when available

## <Tab> Display
# Resolution
osascript ${EXEPATH}/lib/resolution.applescript

# `Scaled` ranged menu
# 1: Larger Text
# 2: Second Larger Text
# 3: Middle
# 4: Default
# 5: More Space

# Brightness

# Automatically adjust brightness

# True Tone

## <Tab> Color
# Display profile

## <Tab> Night Shift
# Schedule
# 1: Off
# 2: Custom
# 3: Sunset to Sunrise

# `Off` Turn On Until Tomorrow

# `Custom` From

# `Custom` to

# `Custom` Turn On Until Later Today

# `Sunset to Sunrise` Turn On Until Sunrise

# Color Temperature

## ========== Energy Saver ==========
# Show battery status in menu bar

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
defaults write .GlobalPreferences InitialKeyRepeat -int 15

# Delay Until Repeat
# params: 2 is the fastest
defaults write .GlobalPreferences KeyRepeat -int 2

# Adjust keyboard brightness in low light

# Turn keyboard backlight off after ~~~ of inactivity

# `Turn keyboard backlight off after ~~~ of inactivity` seconds

# Touch Bar shows
# 1: App Control
# 2: Expanded Control Strip
osascript ${EXEPATH}/lib/touchbar.applescript
# 3: F1, F2, etc. Keys
# 4: Quick Actions


# Press Fn key to
# 1: App Control
# 2: Expanded Control Strip
# 3: F1, F2, etc. Keys
# 4: Quick Actions

# Show keyboard and emoji viewers in menu bar

# Use F1, F2, etx. keys as standard function keys on external keyboards

# <Button> Modifier Keys
# Select keyboard

# Caps Lock Key

# Control Key

# Option Key

# Command Key

# Function Key

## <Tab> Text
# Correct spelling automatically

# Capitalize words automatically

# Add period with double-space

# Touch Bar typing suggestions

# Use smart quotes and dashes

## <Tab> Shortcuts
# Full Keyboard Access
# 1: Text boxes and lists only
# 2: All controls

## <Menu> Launchpad & Dock
# Turn Dock Hiding On/Off

# Show Launchpad

## <Menu> Display
# Decrease display brightness

# Increase display brightness

## <Menu> Mission Control
# Mission Control

# Show Notification Center

# Turn Do Not Disturb On/Off

# Application windows

# Show Desktop

# Show Dashboard

# Move left a space

# Move right a space

# Switch to Desktop 1

## <Menu> Keyboard
# Change the way Tab moves focus

# Turn keyboard access on or off

# Move focus to the menu bar

# Move focus to the Dock

# Move focus to active or next window

# Move focus to the window toolbar

# Move focus to the floating window

# Move focus to next window

# Move focus to the window drawer

# Move focus to status menus

## <Menu> Input Sources
# Select the previous input source

# Select next source in Input menu
osascript ${EXEPATH}/lib/unchecknextsource.applescript

## <Menu> Screenshots
# Save picture of screen as a file

# Copy picture of screen to the clipboard

# Save picture of selected area as a file

# Copy picture of sel...area to the clipboard

# Screenshot and recording options

# Save picture of the Touch Bar as a file

# Copy picture of the...Bar to the clipboard

## <Menu> Services

## <Menu> Spotlight
# Show Spotlight search
osascript ${EXEPATH}/lib/uncheckspotlight.applescript

# Show Finder search window

## <Menu> Accessibility

## <Menu> App Shortcuts
# Show Help menu

## <Menu> Function Keys

## <Tab> Input Sources
Add Input Sources
GJIME=$(defaults read com.apple.HIToolbox AppleEnabledInputSources | grep "InputSourceKind = \"Keyboard Input Method\"")
[[ -z  ${GJIME} ]] && osascript ${EXEPATH}/lib/inputsource.applescript

# Show Input menu in menu bar

# Automatically switch to a document's input source

## <Tab> Dictation
# Dictation

# Use Enhanced Dictation

# Language

# Shortcut

## ========== Mouse ==========

## ========== Trackpad ==========
## <Tab> Point & Click
# Look up & data detectors

# `Look up & data detectors` pop up menu
# 1: Force Click with one finger
# 2: Tap with Three fingers

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

## <Tab> Scroll & Zoom
# Scroll direction: Natural

# Zoom in or out

# Smart zoom

# Rotate

## <Tab> More Gestures
# Swipe between pages

# `Swipe between pages` pop up menu
# 1: Scroll left or right with two fingers
# 2: Swipe with three fingers
# 3: Swipe with two or three fingers

# Swipe between full-screen apps

# `Swipe between full-screen apps` pop up menu
# 1: Scroll left or right with three fingers
# 2: Scroll left or right with four fingers

# Notification Center

# Mission Control

# `Mission Control` pop up menu
# 1: Swipe up with three fingers
# 2: Swipe up with four fingers

# App Expose

# `App Expose` pop up menu
# 1: Swipe down with three fingers
# 2: Swipe down with four fingers

# Launchpad

# Show Desktop

## ========== Printers & Scanners ==========

## ========== Sound ==========
# Show volume in menu bar

## <Tab> Sound Effects
# Select an alert sound

# Play user interface sound effects

# Play feedback when volume is changed

## <Tab> Output
# Balance

## <Tab> Input

## ========== Startup Disk ==========

## ========== iCloud ==========

## ========== Internet Accounts ==========

## ========== Wallet & Apple Pay ==========

## ========== Software Update ==========
# Automatically keep my Mac up to date

## <Button> Advanced
# Check for updates

# Download new updates when available

# Install macOS updates

# Install app updates from the App Store

# Install system data files and security updates

## ========== Network ==========
# Show Wi-Fi status in menu bar

## ========== Bluetooth ==========
# Show Bluetooth status in menu bar

## <Button> Advanced
# Open Bluetooth Setup Assistant at startup if no keyboard is detected

# Open Bluetooth Setup Assistant at startup if no mouse or trackpad is detected

# Allow Bluetooth devices to wake this computer

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

# Keyboard Shortcut

# Language

# Siri Voice

# Voice Feedback

# Show Siri in menu bar

## ========== Date & Time ==========
## <Tab> Date & Time
# Set date and time automatically
sudo systemsetup -setusingnetworktime on > /dev/null

## <Tab> Time Zone

## <Tab> Clock
# Show date and time in menu bar

# Time options
# 1: Digital
defaults write com.apple.menuextra.clock IsAnalog -bool false
# 2: Analog

# Display the time with seconds

# Flash the time separators
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

# Use a 24-hour clock
defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"

# Show AM/PM

# Show the day of the week

# Show date

# Announce the time

## ========== Time Machine ==========
# Back Up Automatically

# Show Time Machine in menu bar

## ========== Accessibility ==========
# !!! This should not be automated

## ========== Profiles ==========

## ----------------------------------------
##	Finder
## ----------------------------------------
## ========== General ==========
# Show these items on the desktop
# 1: Hard disks
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# 2: External disks
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# 3: CDs, DVDs, and iPods
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# 4: Connected servers
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# New Finder windows show
defaults write com.apple.finder NewWindowTarget -string "${HOME}/work"

# Open folders in tabs instead of new windows
defaults write com.apple.finder FinderSpawnTab -bool true

## ========== Tags ==========
# Show these tags in the sidebar

## ========== Sidebar ==========
# Favorite

# Locations

# Tags

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

# SortBy
# 1: Name
# 2: Kind
# 3: Date Last Opened
# 4: Date Added
# 5: Date Modified
# 6: Date Created
# 7: Size
# 8: Tags

# <Button> View Options
# Icon Size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 36" ${HOME}/Library/Preferences/com.apple.finder.plist

# Grid Spacing

# Text Size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" ${HOME}/Library/Preferences/com.apple.finder.plist

# Label Position
# 1: Bottom
# 2: Right

# Show Item Info

# Show Icons

# Show Icon Preview

# Show Column Preview

## ========== View ==========
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

# SortBy
# 1: Name
# 2: Kind
# 3: Date Last Opened
# 4: Date Added
# 5: Date Modified
# 6: Date Created
# 7: Size
# 8: Tags

# Icon Size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 36" ${HOME}/Library/Preferences/com.apple.finder.plist

# Text Size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" ${HOME}/Library/Preferences/com.apple.finder.plist

# Grid Spacing

# Show Item Info

# Show Icon Preview

## ----------------------------------------
##	Extra
## ----------------------------------------
## ========== Dock Applications ==========
zsh ${EXEPATH}/lib/dockitem.zsh

## ========== Default Application ==========

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


## ----------------------------------------
##	Apply All Settings
## ----------------------------------------
if [[ -z "${opthash[(i)--test]}"  ]]; then
	for app in \
		"cfprefsd" \
		"Activity Monitor" "Address Book" "Calendar" \
		"Contacts" "Dock" "Finder" "Mail" "Messages" \
		"SystemUIServer" "Terminal" "Transmission" "iCal"
	do
		killall ${app}
	done
fi;
