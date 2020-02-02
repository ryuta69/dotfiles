<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

## Contents

* **rcfiles** - Several setting files.
* **aliases** - Several languages and tools aliases.
* **package_list** - Installed packages via brew, npm and pip.
* **vscode** - VSCode settings, keybinds, plugins and snippets.
* **install.sh** - Shell for putting files appropriately (Read [Requirements](#Requirements)).

<br />

## Requirements

1. Use this command at first to install required packages (Other packages are listed in package_list/brewlist).

```
brew install git zsh zsh-completion jq nkf gsed neovim ripgrep fzf ghq tig tmux reattach-to-user-namespace

sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
```

2. I place dotfiles at `~/.config/`, and will move to ghq directory someday.

<br />

## Installation
I do not take any responsibility for any loss caused through this way.

<details><summary><b>Zsh(click to open)</b></summary>

1. `zsh`.
2. Type `0` at first selection.
3. `mkdir -p ~/.zsh/completion`
4. `git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts` then `./install.sh` and `cd ../ && rm -rf fonts`.
5. Set the terminal font as "Noto Mono for Powerline".
6. `mv ~/.p10k.zsh ~/.zsh/powerlevel10k/`.
7. `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k && echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc`.
8. `curl -o ~/.zsh/completion/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash && curl -o ~/.zsh/completion/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh && curl -o ~/.zsh/completion/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker && curl -fLo ~/.zsh/completion/_docker-compose https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose && git clone zsh-users/zsh-autosuggestions ~/.zsh/completion/ && git clone zsh-users/zsh-syntax-highlighting ~/.zsh/completion/ && git clone b4b4r07/enhancd ~/.zsh/completion/`.
9. Append `/usr/local/bin/zsh` into the end of `/etc/shells`.
10. `source ~/.zshrc` and set the p10k theme as you like.
11. `chsh -s zsh`.
12. Set VSCode setting `"terminal.integrated.shell.osx": "/usr/local/bin/zsh"`.

</details>

<br />

<details><summary><b>iTerm2(click to open)</b></summary>

1. Set VSCode setting `Terminal > External: Osx Exec` as iTerm.app.
2. `iTerm2 > Install shell integration`.
3. Download [this theme](https://github.com/hwyncho/ayu-iTerm) and apply `iTerm2 > Preferences > Profiles > Color`.
4. `iTerm2 > Preferences > Profiles > General > Working Directory` => `Reuse previous session's directory`.
5. `iTerm2 > Preferences > Profiles > Text > Cursor` => `Vertical bar`.
6. `iTerm2 > Preferences > Profiles > Text > Shell Integration` => off `Show mark indicators`.
7. `iTerm2 > Preferences > General > Selection` => check all.

</details>

<br />

<details><summary><b>Neovim(click to open)</b></summary>

1. `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

</details>

<br />

<details><summary><b>GUI Tools essential to me(click to open)</b></summary>

- [Google Chrome](https://www.google.com/chrome/)
- [Google Japanese Input](https://www.google.co.jp/ime/)
- [VSCode](https://code.visualstudio.com/download)
- [Sublime](https://www.sublimetext.com/3) - It's the best editor while FTP.
- [ShiftIt](http://macappstore.org/shiftit/)
- [Xcode](https://apps.apple.com/jp/app/xcode/id497799835)
- [Android Studio](https://developer.android.com/studio/install) - I don't build Android App, but VR uses some modules.
- [Transmit](https://panic.com/jp/transmit/)
- [Sequel Pro](https://sequelpro.com/download)
- [MongoDB Compass](https://docs.mongodb.com/compass/master/install/)
- [Docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
- [Cloud SDK](https://cloud.google.com/sdk/docs/quickstart-mac-os-x)
- [Local by Flywheel](https://localbyflywheel.com/)
- [Adobe XD](https://www.adobe.com/jp/products/xd.html)
- [Postman](https://www.getpostman.com/downloads/)
- [GPG Suite](https://gpgtools.org/) - Import/Export GPG key get much easier.
- [Slack](https://slack.com/intl/ja-jp/downloads/mac)
- [Line](https://apps.apple.com/jp/app/line/id539883307)
- [Evernote](https://evernote.com/intl/jp/download)
- [Zoom](https://zoom.us/download)
- [Kindle](https://www.amazon.co.jp/Amazon-com-Intl-Sales-Inc-Kindle/dp/B011UEIO4S)
- [AppCleaner](https://appcleaner.softonic.jp/mac)

</details>

<br />

<details><summary><b>Mac Settings(click to open)</b></summary>

# System environment

## General
- Dark mode.
- Accent color is blue.
- Sidebar icon is small.
- Menu auto display is off.
- Scroll bar is always on.
- Clicking scroll bar behave jumping.
- Default browser is chrome.
- Ensure when closing document.
- Close window at exitting application.
- 10 last recent item.
- Not allow handoff.
- Dont use alias character.

## Desktop and Screensaver
- Never start screensaver.

## Dock
- Size is about 1/4 small.
- Off enscale.
- Bottom.
- Effect is Scale.
- Always open tab with document.
- Close with double click.
- Close window in application icon.
- Not animate running application.
- Not automate display dock.
- Show indicator with running application.
- Not showing last recent application used.

## Language and Region
- Set the Japanese priority highest.
- Starting date is monday

## Display
### Display
- Change resolution with expand.
- Don't automate justify fue.
- Never show mirroring option.
### Night Shift
- Custom Schedule starting at 0:00 and finishing at 23:59.
- Set color as the warmest.

## Eco Energy
### Battery
- Off display after 5 minutes.
- Sleep Harddisk at possible.
- Not darken display at battery mode.
- Show battery on menubar.
### Adaptor
- Off display after 5 minutes.
- Not sleep at display off.
- Sleep Harddisk at possible.

## Keyboard
### Keyboard
- Repeat is fastest.
- Recognition is fastest.
- Not adjusting light.
- Not turning light off.
- Don't show viewer.
- Don't function key as default.
- Modification key -> caps lock = control, function = Command.
### User dictionary
- Not Capitalize initial character.
- Not period with 2 space.
### Shortcut
- Turn off automize dock.
- Turn off input source next one.
- Turn off service -> text -> after open.
- Turn off spotlight -> finder.
- Full keyboard access -> textbox and list.
### Input source
- Delete google japanese input "kana" "zenkaku" "default".
- Don't switching input source by document.

## Trackpad
### Point and Click
- Check on detect data.
- Check on click sub button.
- Check on click with tap.
- Click -> strongest.
- Speed -> fastest.
### Scroll and Zoom
- All sets on.

## Sound
### Sound effect
- Show volume in menubar.

## Share
- Set computer name.

## User group
- Set user name and icon.

## Time and Date
- Show date on menubar.
- Set Degital 24 format.
- Show Day and Date.

## Accessibility
- display -> reduce view contrast, reduce opacity, off mouse pointer shaker.

# Finder
## View
- Show status bar.

## Environment Setting
### General
- Item in desktop -> none.
- New window -> ~/work.
- Folder opens as new tab.

## Sidebar
- Desktop
- Download
- Application
- ~/work

## Detail
- Show all filename extension.

# Desktop Display Option
- Icon size -> 36.
- Text size -> 12.

</details>
