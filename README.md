<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

## Contents

* **dotfiles** - Main dotfiles.
* **macos**    - MacOS settings.
* **vscode**   - VSCode settings.
* **guitools** - Macbook settings.
* **packages** - Package Manager files.

<br />

## Installation
I do not take any responsibility for any loss caused.

1. Homebrew

```
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. ghq

```
brew install ghq
ghq get ryuta69/dotfiles
```

3. install.zsh

```
brew install zsh
zsh ./packages/install.zsh
zsh ./dotfiles/install.zsh
zsh ./vscode/install.zsh
zsh ./macos/install.zsh
```
