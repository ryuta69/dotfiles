<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

## Contents

* **dotfiles** - Main dotfiles.
* **macos**    - MacOS settings.
* **vscode**   - VSCode settings.
* **packages** - Package Manager files.

Not only dotfiles,
<img width="600" alt="dotfiles" src="https://user-images.githubusercontent.com/41639488/76142716-89785a80-60b3-11ea-9e0a-d8f2a00025a1.png">

this automates MacOS System Preferences and Applications such as VSCode, Alfred, iTerm and more.

The GIF below shows an automation of setting Apps on Dock by Applescript.

![docklist](https://user-images.githubusercontent.com/41639488/76142705-664dab00-60b3-11ea-9057-db185eaa20fc.gif)

<br />

## Installation
I do not take any responsibility for any loss caused.

### [1/3] Xcode
This process can't be automated.

You can download Xcode by a link below with login.

https://apps.apple.com/us/app/xcode/id497799835?mt=12

### [2/3] install.sh
All installations are controlled by install.sh on top directory.

```
❯ ./install.sh --help

ᓚᘏᗢ < This is my personal dotfiles.

Options for install.sh
=================================================
init:     Core settings for all installations.
packages: Package manager installations.
dotfiles: Dotfiles installations.
vscode:   VSCode settings installations.
macos:    MacOS settings installations.
all:      All installations (except init).
```

### [3/3] Import GPG Key (Optional)
This process can't be automated.

Import GPG Key if you have it on other computers.
