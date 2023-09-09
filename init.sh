# run via: curl -o- https://raw.githubusercontent.com/qwerdenkerXD/dotfiles/master/init.sh | sh
cd ~
if [ -f ./init.sh ]; then   # if this script is run multiple times, it breaks after the first one
    echo "~/init.sh exists -> script already run in the past"
    exit
fi

. .bash_aliases

update
sudo apt install python3-pip texlive-full r-base zsh chroma autojump cargo
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH=$HOME/.cargo/bin:$PATH
cargo install lsd starship
starship preset nerd-font-symbols -o .config/starship.toml
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  # install nvm
. .nvm/nvm.sh
nvm install node
nvm install-latest-npm
pip3 install pycodestyle matplotlib numpy
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/plugins/zsh-syntax-highlighting

if [ -f ~/.bash_profile ]; then   # nvm-installer creates it, but .bashrc won't be loaded then
    rm ~/.bash_profile
fi

git init
git remote add origin https://github.com/qwerdenkerXD/dotfiles
git pull
rm -r .git

# for nerd fonts in shell, copy the .ttf files to C:\Windows\Fonts and select the font in terminal settings
# in true linux (not wsl), copy it to /.local/share/fonts and run fc-cache -fv and then select it for terminal
# I use a self-patched Consolas Nerd Font
