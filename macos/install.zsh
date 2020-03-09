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

## ----------------------------------------
##	Software Preferences
## ----------------------------------------
EXEPATH=$0:A:h

# iTerm2
ln -sfnv ${EXEPATH}/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

# Alfred
mkdir -p ~/Library/ApplicationSupport/Alfred
ln -sfnv ${EXEPATH}/Alfred.alfredpreferences ~/Library/ApplicationSupport/Alfred/Alfred.alfredpreferences

# Karabiner
mkdir -p ~/.config/karabiner
ln -sfnv ${EXEPATH}/karabiner.json ~/.config/karabiner/karabiner.json

# Rectangle
ln -sfnv ${EXEPATH}/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist
defaults write com.knollsoft.Rectangle subsequentExecutionMode -int 2

## ----------------------------------------
##	System Preferences
## ----------------------------------------
# Close setting panel
osascript -e 'tell application "System Preferences" to quit'  > /dev/null 2>&1

# General > Appearance > Dark
defaults write -g AppleInterfaceStyle -string Dark
# General > Sidebar icon size > Small
defaults write -g NSTableViewDefaultSizeMode -int 1
# General > Automatically hide and show the menu bar > unchecked
defaults write -g _HIHideMenuBar -bool false
# General > Show scroll bars > always
defaults write -g AppleShowScrollBars -string Always
# General > Click in the scroll bar to > Jump to the spot that's clicked
defaults write -g AppleScrollerPagingBehavior -bool true
# General > Ask to keep changes when closing documents > unchecked
defaults write -g NSCloseAlwaysConfirmsChanges -bool true
# General > Close windows when quitting an app > checked
defaults write -g NSQuitAlwaysKeepsWindows -bool false
# General > Allow Handoff between this Mac and your iCloud devices
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist ActivityAdvertisingAllowed -bool no
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd.plist ActivityReceivingAllowed -bool no

# Desktop & Screen Saver > Desktop Picture
osascript -e "tell application \"Finder\" to set desktop picture to \"${EXEPATH}/img/wall_phone.jpg\" as POSIX file"
# Desktop & Screen Saver > Screen Saver > Start after > Never
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Dock > Size > 32
defaults write com.apple.dock tilesize -int 30
# Dock > Magnification > unchecked
defaults write com.apple.dock magnification -bool false
# Dock > Position on screen > Bottom
defaults write com.apple.dock orientation -string "bottom"
# Dock > Minimize windows using > Scale
defaults write com.apple.dock mineffect -string "scale"
# Dock > Prefer tabs when opening documents > in Full Screen Only
defaults write -g AppleWindowTabbingMode -string "always"
# Dock > Double click a window's title bar to > minimize
defaults write -g AppleActionOnDoubleClick -string "Minimize"
# Dock > Minimize windows into application item > checked
defaults write com.apple.dock minimize-to-application -bool true
# Dock > Animate opening applications > unchecked
defaults write com.apple.dock launchanim -bool false
# Dock > Autmatically hide and show the Dock > unchecked
defaults write com.apple.dock autohide -bool false
# Dock > Show indicators for open applications > checked
defaults write com.apple.dock show-process-indicators -bool true
# Dock > Show recent applications in Dock > unchecked
defaults write com.apple.dock show-recents -bool false
# Set appilication on Dock
defaults delete com.apple.dock persistent-apps
osascript ${EXEPATH}/lib/dockitem.applescript

# Language & Region > Preferred languages > English, Japanese
defaults write -g AppleLanguages -array en ja
# Language & Region > First day of week > Monday
defaults write -g AppleFirstWeekday -dict gregorian 2

# Security & Privacy > General > Require password immediately
defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Display > Resolution > Scaled > More Space
osascript ${EXEPATH}/lib/resolution.applescript

# Energy Saver > Battery > Turn display off after > 3 minutes
sudo pmset -b displaysleep 3
# Energy Saver > Battery > Put hard disks to sleep when possible > checked
sudo pmset -b disksleep 1
# Energy Saver > Battery > Slightly dim the display while on battery power > unchecked
sudo pmset -b lessbright 0
# Energy Saver > Battery > Enable Power Nap while on battery power > unchecked
sudo pmset -b powernap 0
# Energy Saver > Power Adapter > Turn display off after > 3 minutes
sudo pmset -c displaysleep 3
# Energy Saver > Power Adapter > Put hard disks to sleep when possible > checked
sudo pmset -c disksleep 1
# Energy Saver > Power Adapter > Wake for network access > checked
sudo pmset -c womp 1
# Energy Saver > Power Adapter > Enable Power Nap > unchecked
sudo pmset -c powernap 0

# KeyBoard > Key Repeat & Delay Until Repeat > fastest
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2
# KeyBoard > Touch Bar shows > Expanded Control Strip
osascript ${EXEPATH}/lib/touchbar.applescript
# KeyBoard > Shortcuts > Input Sources > uncheck next input source
osascript ${EXEPATH}/lib/unchecknextsource.applescript
# KeyBoard > Shortcuts > Spotlight > uncheck Spotlight
osascript ${EXEPATH}/lib/uncheckspotlight.applescript
# Keyboard > Input Sources > Add Google Japanese Input
IS_SET_GJIME=$(defaults read com.apple.HIToolbox AppleEnabledInputSources | grep "InputSourceKind = \"Keyboard Input Method\"")
[[ -z  ${IS_SET_GJIME} ]] && osascript ${EXEPATH}/lib/inputsource.applescript

# Trackpad > Tap to click > checked
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# Trackpad > Secondary click > checked > Click or tap with two fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick 1
# Trackpad > Tap to click > checked
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Trackpad > Click > Firmest
defaults write -g com.apple.trackpad.forceClick 2
# Trackpad > Tracking speed > Fastest
defaults write -g com.apple.trackpad.scaling 3

# Date & Time > Time options > Set date and time automatically
sudo systemsetup -setusingnetworktime on > /dev/null
# Date & Time > Clock > Time options > Digital
defaults write com.apple.menuextra.clock IsAnalog -bool false
# Date & Time > Clock > Use a 24-hour clock
defaults write com.apple.menuextra.clock DateFormat -string "HH:mm"
# Date & Time > Clock > Flash the time separators > unchecked
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

# Users & Groups > Change user icon
U_NAME=$(whoami)
sudo dscl . create /Users/${U_NAME} Picture "${EXEPATH}/img/icon.jpeg"

# Apply all settings
killall Dock

## ----------------------------------------
##	Finder
## ----------------------------------------
# General > Show these items on the desktop: Hard disks > unchecked
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# General > Show these items on the desktop: External disks > unchecked
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# General > Show these items on the desktop: CDs, DVDs and iPods > unchecked
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# General > Show these items on the desktop: Connected servers > unchecked
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
# General > New Finder windows show
defaults write com.apple.finder NewWindowTarget -string "~/work"
# General > Open folders in tabs instead of new windows > checked
defaults write com.apple.finder FinderSpawnTab -bool true
# Advanced > Show all file name extensions > checked
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Advanced > Show warning before changing an extension > checked
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true
# Advanced > Show warning before removing iCloud Drive
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false
# Advanced > Show warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool true
# Advanced > Remove items from the Trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
# Advanced > Keep folders on top when sorting by name > unchecked
defaults write com.apple.finder _FXSortFoldersFirst -bool false
# Advanced > When performing a search > Search This Mac
defaults write com.apple.finder FXDefaultSearchScope -string "SCev"
# View > Show Path Bar > checked
defaults write com.apple.finder ShowPathbar -bool true
# View > Show Status Bar > checked
defaults write com.apple.finder ShowStatusBar -bool true
# View > Show Sidebar > checked
defaults write com.apple.finder ShowSidebar -bool true
# View > Show Preview > checked
defaults write com.apple.finder ShowPreviewPane -bool true

# Apply all settings
killall Finder

## ----------------------------------------
##	Desktop
## ----------------------------------------
# Text size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" ~/Library/Preferences/com.apple.finder.plist
# Icon size
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 36" ~/Library/Preferences/com.apple.finder.plist

## ----------------------------------------
##	Hidden Command
## ----------------------------------------
# Show hidden file
defaults write com.apple.finder AppleShowAllFiles -string YES
# Column View
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# Show percentage of battery
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Disable the gAre you sure you want to open this application?h dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Disable DS_STORE
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## ----------------------------------------
##	Google Chrome
##	- Setup when you create new user.
## ----------------------------------------
# System Preferences > General > Default web browser
osascript ${EXEPATH}/lib/defaultbrowser.applescript
if [[ -z "${opthash[(i)--test]}"  ]]; then
	# # Adblock
	# open https://chrome.google.com/webstore/detail/adblock-%E2%80%94-best-ad-blocker/gighmmpiobklfepjocnamgkkbiglidom
	# # Lighthouse
	# open https://chrome.google.com/webstore/detail/lighthouse/blipmdconlkpinefehnmjammfjpmpbjk
	# # Wappalyzer
	# open https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg
	# # Just Black
	# open https://chrome.google.com/webstore/detail/just-black/aghfnjkcakhmadgdomlmlhhaocbkloab
	# # Clear Cache
	# open https://chrome.google.com/webstore/detail/clear-cache/cppjkneekbjaeellbfkmgnhonkkjfpdn
	# # Leoh New Tab
	# open https://chrome.google.com/webstore/detail/leoh-new-tab/ijhhakihjccpanbibbcceofpjnebokcb
	# # Google Translate
	# open https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb
	# # Youtube Repeat Button
	# open https://chrome.google.com/webstore/detail/youtube-repeat-button/aihdpnkmhcbjkfonmmfepcjjfaenobipl
fi;
