# Enable Windows subsystem for Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Enable Virtual Platform
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Reboot
shutdown -r -t 0
