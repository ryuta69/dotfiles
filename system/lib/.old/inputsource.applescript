set addcmd to "<dict><key>Bundle ID</key><string>com.google.inputmethod.Japanese</string><key>InputSourceKind</key><string>Keyboard Input Method</string></dict>"

do shell script "defaults write com.apple.HIToolbox AppleEnabledInputSources -array-add '" & addcmd & "'"
