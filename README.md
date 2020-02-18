<h3 align="center">My Dotfiles</h3>
<p align="center">ᓚᘏᗢ Just personal settings.</p>

## Contents

* **img**         - Images and theme for an environment.
* **rcfiles**     - Several setting files.
* **aliases**     - Several languages and tools aliases.
* **vscode**      - VSCode settings, keybinds, and plugins.
* **syncenv**     - Alfred and iTerm2.
* **packages**    - Installed packages via brew, npm and pip.
* **install.zsh** - Set rcfiles on home directory (/rcfiles).
* **bookmarks**   - Chrome bookmarks.

<br />

## Requirements

1. Use this command at first to install required packages (Other packages are listed in packages).

```
brew install git zsh zsh-completion jq nkf gsed neovim ripgrep fzf ghq hub tig tmux reattach-to-user-namespace

sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight
```

2. I place dotfiles at `~/.ghq/github.com/ryuta69/dotfiles` with ghq.

<br />

## Installation
I do not take any responsibility for any loss caused through this way.

<details><summary><b>Zsh(click to open)</b></summary>

1. Active zsh at first time and type `0` at first selection.
2. Set the terminal font as "Noto Mono for Powerline".
3. Append `/usr/local/bin/zsh` into the end of `/etc/shells`.
4. `chsh -s zsh`.
5. Set VSCode setting `"terminal.integrated.shell.osx": "/usr/local/bin/zsh"`.

</details>

<br />

<details><summary><b>iTerm2(click to open)</b></summary>

1. Set VSCode setting `Terminal > External: Osx Exec` as iTerm.app.
2. `iTerm2 > General > Preferences > Load Preferences from a custom folder > import rcfiles/iterm2.conf

</details>

<br />

<details><summary><b>Neovim(click to open)</b></summary>

1. `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

</details>

<br />

## MacBook Setup

### GUI Tools essential to me

- [Line](https://apps.apple.com/jp/app/line/id539883307)
- [Zoom](https://zoom.us/download)
- [Slack](https://slack.com/intl/ja-jp/downloads/mac)
- [Xcode](https://apps.apple.com/jp/app/xcode/id497799835)
- [Alfred](https://www.alfredapp.com/)
- [Docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac)
- [Kindle](https://www.amazon.co.jp/Amazon-com-Intl-Sales-Inc-Kindle/dp/B011UEIO4S)
- [VSCode](https://code.visualstudio.com/download)
- [Discord](https://discordapp.com/download)
- [Postman](https://www.getpostman.com/downloads/)
- [ShiftIt](http://macappstore.org/shiftit/)
- [Sublime](https://www.sublimetext.com/3) - It's the best editor while FTP.
- [Adobe XD](https://www.adobe.com/jp/products/xd.html)
- [Evernote](https://evernote.com/intl/jp/download)
- [Transmit](https://panic.com/jp/transmit/)
- [Cloud SDK](https://cloud.google.com/sdk/docs/quickstart-mac-os-x)
- [GPG Suite](https://gpgtools.org/) - Import/Export GPG key get much easier.
- [AppCleaner](https://appcleaner.softonic.jp/mac)
- [Sequel Pro](https://sequelpro.com/download)
- [Google Chrome](https://www.google.com/chrome/) - Set Language to English. Below are the extensions.
  - [Adblock](https://chrome.google.com/webstore/detail/adblock-%E2%80%94-best-ad-blocker/gighmmpiobklfepjocnamgkkbiglidom)
  - [Lighthouse](https://chrome.google.com/webstore/detail/lighthouse/blipmdconlkpinefehnmjammfjpmpbjk)
  - [Wappalyzer](https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg)
  - [Just Black](https://chrome.google.com/webstore/detail/just-black/aghfnjkcakhmadgdomlmlhhaocbkloab)
  - [Clear Cache](https://chrome.google.com/webstore/detail/clear-cache/cppjkneekbjaeellbfkmgnhonkkjfpdn)
  - [Leoh New Tab](https://chrome.google.com/webstore/detail/leoh-new-tab/ijhhakihjccpanbibbcceofpjnebokcb)
  - [Google Translator](https://chrome.google.com/webstore/detail/google-translate/aapbdbdomjkkjkaonfhkkikfgjllcleb)
  - [Youtube Repeat Button](https://chrome.google.com/webstore/detail/youtube-repeat-button/aihdpnkmhcbjkfonmmfepcjjfaenobip)
- [Android Studio](https://developer.android.com/studio/install) - I don't build Android App, but debugging VR uses some modules.
- [MongoDB Compass](https://docs.mongodb.com/compass/master/install/)
- [Local by Flywheel](https://localbyflywheel.com/)
- [Google Japanese Input](https://www.google.co.jp/ime/)


<br />

<details><summary><b>Mac Settings(click to open)</b></summary>

## System environment

### General
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

### Desktop and Screensaver
- Never start screensaver.

### Dock
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

### Language and Region
- Set the English priority highest.
- Starting date is monday

### Display
#### Display
- Change resolution with expand.
- Don't automate justify fue.
- Never show mirroring option.
#### Night Shift
- Custom Schedule starting at 0:00 and finishing at 23:59.
- Set color as the warmest.

### Eco Energy
#### Battery
- Off display after 5 minutes.
- Sleep Harddisk at possible.
- Not darken display at battery mode.
- Show battery on menubar.
#### Adaptor
- Off display after 5 minutes.
- Not sleep at display off.
- Sleep Harddisk at possible.

### Keyboard
#### Keyboard
- Repeat is fastest.
- Recognition is fastest.
- Not adjusting light.
- Not turning light off.
- Don't show viewer.
- Don't function key as default.
- Modification key -> caps lock = control, function = Command.
#### User dictionary
- Not Capitalize initial character.
- Not period with 2 space.
#### Shortcut
- Turn off automize dock.
- Turn off input source next one.
- Turn off service -> text -> after open.
- Turn off spotlight -> finder.
- Full keyboard access -> textbox and list.
- Spotlight -> option + space.
#### Input source
- Delete google japanese input "kana" "zenkaku" "default".
- Don't switching input source by document.

### Trackpad
#### Point and Click
- Check on detect data.
- Check on click sub button.
- Check on click with tap.
- Click -> strongest.
- Speed -> fastest.
#### Scroll and Zoom
- All sets on.

### Sound
#### Sound effect
- Show volume in menubar.

### Share
- Set computer name.

### User group
- Set user name and icon.

### Time and Date
- Show date on menubar.
- Set Degital 24 format.
- Show Day and Date.

### Accessibility
- display -> reduce view contrast, reduce opacity, off mouse pointer shaker.

## Finder
### View
- Show status bar.

### Environment Setting
#### General
- Item in desktop -> none.
- New window -> ~/work.
- Folder opens as new tab.

### Sidebar
- Desktop
- Download
- Application
- ~/work

### Detail
- Show all filename extension.

## Desktop Display Option
- Icon size -> 36.
- Text size -> 12.

</details>
