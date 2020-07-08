<br />

<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal MacOS settings.</p>

<img alt="dotfiles" src="https://user-images.githubusercontent.com/41639488/86676863-03a2f680-c036-11ea-9b62-b0f94d506e4b.png">

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

## Features

- CUI envs with iTerm, Tmux, Zsh, Neovim, FZF, and more.
- GUI envs with VSCode, Ubersicht, Karabiner, and more.
- MacOS system settings (Windows and Linux are [here](https://github.com/ryuta69/dotfiles/tree/master/system/.windows_and_linux)).
- WM and Launcher with Yabai, Skhd, and Alfred like below.

[full video link](https://youtu.be/Gv_rnu-dDOs)

![yabai](https://user-images.githubusercontent.com/41639488/86599039-09b6ba00-bfd9-11ea-9c31-6a78648deb3b.gif)

<br />

## Thanks
These links gave me great ideas and motivations.

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

https://github.com/kevinSuttle/macOS-Defaults/blob/master/REFERENCE.md

https://github.com/tech-otaku/macos-config-mojave/blob/master/macos-config.sh
