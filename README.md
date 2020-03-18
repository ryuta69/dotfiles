<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

## Contents

* **dotfiles** - Main dotfiles.
* **macos**    - MacOS settings.
* **vscode**   - VSCode settings.
* **packages** - Package Manager files.

Not only dotfiles,

<img alt="dotfiles" src="https://user-images.githubusercontent.com/41639488/76944865-14274800-6945-11ea-97a8-831930f5b5ab.png">

this automates MacOS System Preferences and Applications such as VSCode, Alfred, iTerm and more.

The GIF below shows an automation of setting Apps on Dock by Applescript.

![docklist](https://user-images.githubusercontent.com/41639488/76142705-664dab00-60b3-11ea-9057-db185eaa20fc.gif)

<br />

## Installation
I do not take any responsibility for any loss caused.

### [1/3] curl

By default, You don't have any CLI such as git, make, nor wget.

This initialization could be completed by curl and bash only.

```bash
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/install.sh | /bin/bash -s -- --init
```

### [2/3] Restart a terminal

### [3/3] install.sh

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

## Thanks
These links gave me great ideas and motivations.

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

https://github.com/tech-otaku/macos-config-mojave/blob/master/macos-config.sh

https://apple.stackexchange.com/questions/250274/how-can-one-open-a-specific-tab-in-preferences-via-terminal/250276#250276
