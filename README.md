<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

## Contents

* **dotfiles** - main dotfiles[(detail)](#user-content-23-dotfiles).
* **bundle** - bundlers and packages[(detail)](#user-content-13-bundle).
* **system** - macos system setting[(detail)](#user-content-33-system).

<br />

Not only dotfiles,

<img alt="dotfiles" src="https://user-images.githubusercontent.com/41639488/76955071-d9c5a700-6954-11ea-818c-19be19be1468.png">

this also automates MacOS System Preferences and Applications such as VSCode, Alfred, iTerm and more.

The GIF below shows an automation of setting Apps on Dock by Applescript.

![dockitem](https://user-images.githubusercontent.com/41639488/76949300-a92d3f80-694b-11ea-9af9-22dba8f3a2c8.gif)

<br />

## Installation
I do not take any responsibility for any loss caused.

### First of all, you need to initialize
By default, You don't have any CLI such as git, make, nor wget.

This initialization could be completed only by curl and bash, and it will give you a minimum required dependencies.

```bash
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/install.sh | /bin/bash -s -- --init
```

This initialization will install these tools. You must restart terminal after completed.

* **brew** -- macos package manager
* **zsh** -- zsh managed via brew and set as default shell
* **xcode cli tools** -- install commonly [61 CLI tools](https://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/)
* **ssh hostinfo of github.com** -- add github hostinfo to .ssh/config

### After initialization, let's install each configurations
All installations are controlled by install.sh on top directory.

```
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

You should follow the below by its order. You can look up these configured files and customize as you want, or pick up the only things you want.

#### [1/3] Bundle
```
./install.sh --bundle
```
This will install CLI tools and GUI applications below via package managers.

* **Brewfile** -- cli tools by brew, gui applications by cask, appstore applications by mas
* **Npmfile** -- npm global dependencies
* **Pipfile** -- pip global dependencies
* **VscodePlugin** -- vscode plugins
* **install.zsh** -- tmux plugin bundler, neovim plugin bundler, rustup bundler, zsh-completions

#### [2/3] Dotfiles
```
./install.sh --dotfiles
```
These dotfiles are tools settings. It will be symlinked forcely to $HOME directory.

* **vscode config** -- settings.json, keybingings.json
* **alias** -- .aliases ([editor aliases are in Alfred](https://github.com/ryuta69/dotfiles/tree/master/dotfiles/Alfred.alfredpreferences/snippets).)
* **macos config** -- [com.knollsoft.Rectangle.plist](https://github.com/rxhanson/Rectangle), [karabiner.json](https://github.com/pqrs-org/Karabiner-Elements)
* **application configs** -- [.ctags](https://github.com/universal-ctags/ctags), [.my.conf](https://github.com/mysql), [.myclirc](https://github.com/dbcli/mycli), [.rustcfg](https://github.com/rust-lang/rust), [.tigrc](https://github.com/jonas/tig), [.vimrc/init.vim](https://github.com/neovim/neovim)
* **git config** -- .gitconfig, .gitattributes, .gitignore, .git_template
* **terminal config** -- [.zshrc](https://github.com/zsh-users/zsh), [com.googlecode.iterm2.plist](https://github.com/gnachman/iTerm2), [.p10k.zsh](https://github.com/romkatv/powerlevel10k), [.tmux.conf](https://github.com/tmux/tmux)

#### [3/3] System
```
./install.sh --system
```
These configurations are MacOS System Preferences and Core settings.

* **lib** -- plistbuddy script library
* **img** -- profile icon and desktop picture
* **install.zsh** -- all macos system configurations

## Thanks
These links gave me great ideas and motivations.

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

https://github.com/kevinSuttle/macOS-Defaults/blob/master/REFERENCE.md

https://github.com/tech-otaku/macos-config-mojave/blob/master/macos-config.sh

