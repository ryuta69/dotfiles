## Windows
You need version 2004, build 19041 or upper. You can check with winver in command prompt.
If not satisfied, install here.

```powershell
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/bundle/.windows/windows_set_virtualhost.ps1 -o .\set_virtualhost.ps1 -UseBasicParsing
.\set_virtualhost.ps1

# Computer will reboot.

curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/bundle/.windows/windows_install.ps1 -o .\install.ps1 -UseBasicParsing
.\install.ps1
```

Launch wsl2 of Windows Terminal Preview.

```bash
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/bundle/.windows/debian_install.sh | /bin/bash -s --
```

## Linux (Debian)

```bash
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/bundle/.windows/debian_install.sh | /bin/bash -s --
```
