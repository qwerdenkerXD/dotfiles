# run via: curl -o- https://raw.githubusercontent.com/qwerdenkerXD/dotfiles/master/init.sh | sh
cd ~
if [ -f ./init.sh ]; then   # if this script is run multiple times, it breaks after the first one
    echo "~/init.sh exists -> script already run in the past"
    exit
fi

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install zsh lsd python git r neovim texlive gh glab autojump chroma pycodestyle starship

CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git .oh-my-zsh/plugins/zsh-syntax-highlighting

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash  # install nvm
. .nvm/nvm.sh
nvm install node
nvm install-latest-npm

if [ -f ~/.bash_profile ]; then   # nvm-installer creates it, but .bashrc won't be loaded then
    rm ~/.bash_profile
fi

python3 -m venv .pyenv
. .pyenv/bin/activate
python3 -m pip install matplotlib numpy scipy tqdm pandas

git init
git remote add origin https://github.com/qwerdenkerXD/dotfiles
rm .bashrc .zshrc
git pull origin master
sudo rm -r .git

# set zsh as default shell
command -v zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)

gh auth login

# for nerd fonts in shell, copy the .ttf files to C:\Windows\Fonts and select the font in terminal settings
# in true linux (not wsl), copy it to /.local/share/fonts and run fc-cache -fv and then select it for terminal
# I use a self-patched Consolas Nerd Font
