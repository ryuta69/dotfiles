#! /usr/local/bin/zsh

local -A opthash
zparseopts -D -A opthash -- -force -help

if [[ -n ${opthash[(i)--help]} ]]; then
        echo "Add option --force to install without checking." && exit;
fi

if [[ -z ${opthash[(i)--force]}  ]]; then
        read Ans"?Your file will be overwritten(Y/n): ";
        if [[ $Ans != 'Y' ]]; then echo 'Canceled' && exit; fi;
fi

EXEPATH=$0:A:h

brew upgrade
brew unlink node
brew bundle --file ${EXEPATH}/Brewfile
git lfs install
rustup-init

npm update -g npm
npm install -g $(cat ${EXEPATH}/Npmfile)

pip install --upgrade pip
pip install -r ${EXEPATH}/Pipfile

curl https://sh.rustup.rs -sSf | sh -s -- -y
rustup install nightly
rustup default nightly
rustup component add rls-preview --toolchain nightly
rustup component add rust-analysis --toolchain nightly
rustup component add rust-src --toolchain nightly
cargo install rustsym

# mysql_secure_installation
