<br />

<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

<img alt="cowboy brown" src="https://user-images.githubusercontent.com/41639488/92177661-e34bb880-ee7b-11ea-83bc-63149f6051bb.png">

Not only dotfiles, with one command from Factory-Reset-OS, it automatically sets [All of MacOS System Preferences](https://github.com/ryuta69/dotfiles/blob/master/system/macos.sh), installs [Applications and Plugins](https://github.com/ryuta69/dotfiles/tree/master/bundle), and enables [Launcher and Window Manager](https://github.com/ryuta69/dotfiles/tree/master/dotfiles/.library). There are also [Windows and Linux setup scripts](https://github.com/ryuta69/dotfiles/tree/master/system/.windows_and_linux).

You can change several themes anytime with only one command. These are my original themes. More themes are [here: dotfiles/.themes](https://github.com/ryuta69/dotfiles/blob/master/dotfiles/.themes).

<table>
    <tbody>
        <tr>
            <td><img alt="sunset orange" src="https://user-images.githubusercontent.com/41639488/91911058-435f2500-eceb-11ea-98c3-45ee1aab066a.png"></td>
            <td><img alt="calm bluegreen" src="https://user-images.githubusercontent.com/41639488/92177299-31ac8780-ee7b-11ea-8706-10af1f4a6611.png"></td>
        </tr>
        <tr>
            <td><img alt="vivid green" src="https://user-images.githubusercontent.com/41639488/92177442-79331380-ee7b-11ea-9b0b-a421671c3400.png"></td>
            <td><img alt="skynight blue" src="https://user-images.githubusercontent.com/41639488/92177737-0aa28580-ee7c-11ea-8a61-c5b2c482d8a3.png"></td>
        </tr>
    </tbody>
</table>

<br />

## Installation

```bash
# Initialize to install core tools such as xcode, brew, and zsh.
# By default, You don't have any CLI such as git, make, nor wget.
# This uses only by curl and bash, and it will be completed automatically.
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/install.sh | /bin/bash -s -- --init

./install.sh --dotfiles # Symlink dotfiles to its directories
# ./install.sh --bundle # Install CUI and GUI apps and plugins
# ./install.sh --system # Configure MacOS system settings
# ./install.sh --all # Setup all including initialize
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
#### knowledge

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

https://github.com/kevinSuttle/macOS-Defaults/blob/master/REFERENCE.md

https://github.com/tech-otaku/macos-config-mojave/blob/master/macos-config.sh

#### design

https://github.com/alnj/dotfiles

https://www.reddit.com/r/unixporn/comments/hyuvk6/dwm_cats_meow/

https://github.com/yoyostile/nerdbar.widget-1

https://www.reddit.com/r/unixporn/

https://www.reddit.com/r/unixporn/comments/i60b10/awesome_streets_of_gruvbox

https://github.com/owl4ce/dotfiles
