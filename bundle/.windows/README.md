This shows how to setup windows.
I will make dotfiles later based on this.

## Requirements
You need version 2004, build 19041 or upper. You can check with winver in command prompt.
If not satisfied, install here.
https://www.microsoft.com/software-download/windows10


## Step

### Windows

```powershell
# Enable Windows subsystem for Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Enable Virtual Platform
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Reboot
shutdown -r -t 0
```

```powershell
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Kali Linux for WSL
# choco install wsl-kalilinux -y
# It used to be nice, but it requires privacy authentication now.
# That means not automated with scripts, so install from store.

# Set WSL2 as default
wsl --set-default-version 2

# Install Windows Terminal
choco install microsoft-windows-terminal -y

# Install Hack Font
choco install hackfont -y
```

### Kali Linux

```bash
sudo apt update
sudo apt upgrade
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
```
