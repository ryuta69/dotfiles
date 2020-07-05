# !/bin/bash

sudo apt update
sudo apt upgrade

sudo apt install git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
sudo apt install build-essential

mkdir -p ${HOME}/.ssh
ssh-keygen -t rsa -b 4096 -C "eyma22s.yu@gmail.com"
ssh-keyscan -t rsa github.com >> ${HOME}/.ssh/known_hosts

brew install zsh
sudo sh -c 'echo /home/linuxbrew/.linuxbrew/bin/zsh >> /etc/shells'
sudo chsh -s /usr/local/bin/zsh
touch ${HOME}/.hushlogin

exec -l ${SHELL}

brew upgrade
brew install fd fx jq bat exa fzf git hub nkf vim grep tldr tmux neovim gnu-sed ripgrep neofetch git-delta hyperfine git-secrets zsh-completions go gcc perl node ruby cmake cpanm python rustup mysql

npm update -g npm
npm install -g npm yarn typescript

pip3 install --upgrade pip
pip3 install numpy imgcat pynvim requests

rustup-init -y
source ${HOME}/.cargo/env
rustup component add rls --toolchain stable
rustup component add rust-src --toolchain stable
rustup component add rls-preview --toolchain stable
rustup component add rust-analysis --toolchain stable
cargo install ytop
cargo install du-dust
cargo install -f --git https://github.com/jez/as-tree

curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/bundle/Vsplug > ~/Vsplug
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/dotfiles/.vimrc > ~/.vimrc
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/dotfiles/.zshrc > ~/.zshrc
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/dotfiles/.p10k.zsh > ~/.p10k.zsh
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/dotfiles/.gitconfig > ~/.gitconfig
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/dotfiles/.gitignore > ~/.gitignore
curl https://raw.githubusercontent.com/ryuta69/dotfiles/master/dotfiles/.tmux.conf > ~/.tmux.conf
mkdir ${HOME}/.config/nvim
cp ${HOME}/.vimrc ${HOME}/.config/nvim/init.vim

zinit self-update
source ${HOME}/.zshrc

curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa
curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +'PlugInstall --sync' +qa

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
/bin/bash ${HOME}/.tmux/plugins/tpm/scripts/install_plugins.sh

plugins=($(cat ${HOME}/Vsplug))
for plugin in ${plugins}; do
	code --install-extension ${plugin}
done
