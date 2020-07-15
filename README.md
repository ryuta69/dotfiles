<br />

<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

<img alt="dotfiles" src="https://user-images.githubusercontent.com/41639488/87268147-a363f700-c504-11ea-8164-b6c5a56d038c.png">

Not only dotfiles, with one command, it sets [All of MacOS System Preferences](https://github.com/ryuta69/dotfiles/blob/master/system/macos.sh), installs [applications and its plugins](https://github.com/ryuta69/dotfiles/tree/master/bundle), and enables [Launcher and Window Manager](https://github.com/ryuta69/dotfiles/tree/master/dotfiles/.library) to recovery from Factory-Reset-OS. More screenshots are [here](https://github.com/ryuta69/dotfiles/issues/1). There are also [Windows and Linux setup scripts](https://github.com/ryuta69/dotfiles/tree/master/system/.windows_and_linux).

<br />

## Installation

```bash
# Initialize to install core tools such as xcode, brew, and zsh.
# By default, You don't have any CLI such as git, make, nor wget.
# This uses only by curl and bash, and it will be completed automatically.
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/install.sh | /bin/bash -s -- --init

# Install CUI and GUI apps and plugins. `--bundle`
# Symlink dotfiles to its directories. `--dotfiles`
# Configure MacOS system settings. `--system`
./install.sh --all
```

#### Options

```bash
❯ ./install.sh --help

ᓚᘏᗢ < This is my personal dotfiles.

Options for install.sh
=================================================
init:     Core intialization
bundle:   Package installation
system:   MacOS system setting
dotfiles: Dotfiles installation
all:      All installations (except init)
```

<br />

## Thanks
These links gave me great ideas and motivations.

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

https://github.com/kevinSuttle/macOS-Defaults/blob/master/REFERENCE.md

https://github.com/tech-otaku/macos-config-mojave/blob/master/macos-config.sh
