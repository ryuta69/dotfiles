<br />

<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

<img alt="dotfiles" src="https://user-images.githubusercontent.com/41639488/91911058-435f2500-eceb-11ea-98c3-45ee1aab066a.png">

Not only dotfiles, with one command from Factory-Reset-OS, it sets [All of MacOS System Preferences](https://github.com/ryuta69/dotfiles/blob/master/system/macos.sh), installs [Applications and Plugins](https://github.com/ryuta69/dotfiles/tree/master/bundle), and enables [Launcher and Window Manager](https://github.com/ryuta69/dotfiles/tree/master/dotfiles/.library). There are also [Windows and Linux setup scripts](https://github.com/ryuta69/dotfiles/tree/master/system/.windows_and_linux).

You can change themes with one command anytime. These are my original theme.

### Calm BlueGreen
<img alt="calm bluegreen" src="https://user-images.githubusercontent.com/41639488/92177299-31ac8780-ee7b-11ea-8706-10af1f4a6611.png">

### ViVid Green
<img alt="vivid green" src="https://user-images.githubusercontent.com/41639488/92177442-79331380-ee7b-11ea-9b0b-a421671c3400.png">

### Cowboy Brown
<img alt="cowboy brown" src="https://user-images.githubusercontent.com/41639488/92177661-e34bb880-ee7b-11ea-83bc-63149f6051bb.png">

### Mist BlueGreen
<img alt="mist bluegreen" src="https://user-images.githubusercontent.com/41639488/92177901-5a814c80-ee7c-11ea-86a6-8c2f72136c60.png">

More themes are [here](https://github.com/ryuta69/dotfiles/blob/master/dotfiles/.pywal).

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
These links gave me knowledges.

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

https://github.com/kevinSuttle/macOS-Defaults/blob/master/REFERENCE.md

https://github.com/tech-otaku/macos-config-mojave/blob/master/macos-config.sh

These links are great designs impressed me.

https://github.com/alnj/dotfiles

https://www.reddit.com/r/unixporn/comments/hyuvk6/dwm_cats_meow/

https://github.com/yoyostile/nerdbar.widget-1

https://www.reddit.com/r/unixporn/

https://www.reddit.com/r/unixporn/comments/i60b10/awesome_streets_of_gruvbox
