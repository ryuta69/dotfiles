<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

## Contents

* **dotfiles** - main dotfiles. [(Detail)](#user-content-14-packages)
* **bundle** - bundlers and packages. [(Detail)](#user-content-44-macos-not-recommended-if-youre-not-sure-what-this-is)
* **system** - macos system setting. [(Detail)](#user-content-24-dotfiles)

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

* **Brew** -- macos package manager.
* **zsh** -- install zsh via brew and set as default shell.
* **ssh hostinfo of Github.com** -- add Github host info to .ssh/config.
* **Xcode CLI tools** -- install commonly [61 CLI tools](https://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/).

### After initialization, let's install each configurations
All installations are controlled by install.sh on top directory.

```
❯ ./install.sh --help

ᓚᘏᗢ < This is my personal dotfiles.

Options for install.sh
=================================================
init:     Core settings for all installation
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
This will install all CLI tools and GUI applications via package managers.

* **CLI tools by Brew** -- configured in bundle/Brewfile.
* **GUI applications by Brew Cask** -- configured in bundle/Brewfile.
* **AppStore applications by mas** -- configured in bundle/Brewfile.
* **Npm Global dependencies by npm** -- configured in bundle/Npmfile.
* **Pip Global dependencies by pip** -- configured in bundle/Pipfile.
* **VSCode plugins by code** -- configured in bundle/VSCodePluginfile.
* **Rust Bundle and LS by rustup** -- configured in bundle/install.zsh.
* **Tmux plugin bundle by git** -- configured in bundle/install.zsh.
* **Neovim plugin bundle by curl** -- configured in bundle/install.zsh.
* **diff-highlight of git by gitcore** -- configured in bundle/install.zsh.

#### [2/3] Dotfiles
```
./install.sh --dotfiles
```
These dotfiles are tools settings. It will be symlinked forcely to $HOME directory.

* **.ctags** -- ctags settings.
* **.rustcfg** -- rust settings.
* **.tmux.conf** -- tmux configurations.
* **.zshrc / .zsh** -- zshell configurations.
* **.tigrc** -- tig, which is a git interface tool settings.
* **.gitconfig / .gitattributes / .git_template** -- git configrations.
* **init.vim** -- neovim configrations. It almost is compatible with vim.
* **.my.conf / .myclirc** -- mysql and mycli, which is a MySQL interface tool settings.
* **.aliases** -- my favorite but not used always aliases. They will be loaded by `soal` command which is cofigured in .zshrc.
* **.vscode_settings.json** -- vscode user settings.
* **.vscode_keybindings.json** -- vscode shortcut key settings.
* **karabiner.json** -- macos keybindings configurations.
* **com.google.code.iterm2.plist** -- macos terminal simulator configurations.
* **com.knollsoft.Rectangle.plist** -- macos window controller configurations.
* **Alfred.alfredpreferences** -- macos lancher configrations. It has All Snippets as well. It contains Premiam features.

#### [3/3] System (Not Recommended if you're not sure what this is.)
```
./install.sh --system
```
These configurations are MacOS System Preferences and Core settings.

* **lib** -- plistbuddy script library.
* **img** -- profile icon and desktop picture.
* **install.zsh** -- all macos system configurations.

## Thanks
These links gave me great ideas and motivations.

https://qiita.com/b4b4r07/items/b70178e021bef12cd4a2

https://github.com/tech-otaku/macos-config-mojave/blob/master/macos-config.sh

https://apple.stackexchange.com/questions/250274/how-can-one-open-a-specific-tab-in-preferences-via-terminal/250276#250276
