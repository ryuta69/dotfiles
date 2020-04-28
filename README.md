<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

<img alt="dotfiles" src="https://user-images.githubusercontent.com/41639488/80442463-e8d24880-8947-11ea-8b5d-bcacb68e98f6.png">

Not only symlinking dotfiles, this repository also installs applications and configures MacOS system.

The gif below shows this repository's feature that automates setting dock applications.

![dockitem](https://user-images.githubusercontent.com/41639488/79629823-76af7600-8187-11ea-8a5c-39f49caf4159.gif)

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

### Options

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

## Thanks
These links gave me great ideas and motivations.

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

https://github.com/kevinSuttle/macOS-Defaults/blob/master/REFERENCE.md

https://github.com/tech-otaku/macos-config-mojave/blob/master/macos-config.sh
