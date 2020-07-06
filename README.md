<br />

<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal MacOS settings.</p>

<img alt="dotfiles" src="https://user-images.githubusercontent.com/41639488/86551928-71411b00-bf81-11ea-834f-297635de42dc.png">

Not only symlinking [dotfiles](https://github.com/ryuta69/dotfiles/tree/master/dotfiles), this repository also installs [applications](https://github.com/ryuta69/dotfiles/tree/master/bundle) and configures [MacOS system](https://github.com/ryuta69/dotfiles/tree/master/system).

This repository is mainly for MacOS, but there are scripts for Windows and Linux [here](https://github.com/ryuta69/dotfiles/tree/master/system/.windows_and_linux).

<br />

## Installation

```bash
# Initialize to install core tools such as xcode, brew, and zsh.
# By default, You don't have any CLI such as git, make, nor wget.
# This uses only by curl and bash, and it will be completed automatically.
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/install.sh | /bin/bash -s -- --init

# Install Bundle such as brew, applications, appstore, npm, pip, and cargo.
./install.sh --bundle

# Symlink dotfiles to appropriate directories.
./install.sh --dotfiles

# Configure MacOS Core systems.
./install.sh --system
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

## Features
Full Catalina System Configurations are scripted. Using iTerm, Tmux, Zsh, and Neovim mainly with minimal yet powerful plugins. FZF, MyCli, VSCode, and many other brew/npm/pip/vscode packages and their configurations are listed and can be installed in one command. Also, I heavily use Yabai, Skhd, Ubersicht, and Alfled in daily like below.

[full video link](https://youtu.be/Gv_rnu-dDOs)

![yabai](https://user-images.githubusercontent.com/41639488/86599039-09b6ba00-bfd9-11ea-9c31-6a78648deb3b.gif)

<br />

## Thanks
These links gave me great ideas and motivations.

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

https://github.com/kevinSuttle/macOS-Defaults/blob/master/REFERENCE.md

https://github.com/tech-otaku/macos-config-mojave/blob/master/macos-config.sh

