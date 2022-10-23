#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine="Linux";;
    Darwin*)    machine="Mac";;
    CYGWIN*)    machine="Cygwin";;
    MINGW*)     machine="MinGw";;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Set hostname
read -p "Enter desired hostname: " hostname
if [ ! -z "$hostname" ]
then
	sudo su -c "echo '$hostname' > /etc/hostname"
fi

# Start and enable ssh
if [ $machine == "Linux" ]
then
	echo "Starting and enabling ssh..."
	sleep 1s
	sudo systemctl start sshd
	sudo systemctl enable sshd
fi

# Make directories we need for configs
echo "Making directories for configs.."
sleep 1s
mkdir ~/.config/nvim ~/.ssh 2>/dev/null

# Copy configs to dirs
echo "Copying configs..."
sleep 1s
cp configs/init.vim ~/.config/nvim/
cp configs/.zshrc ~/.zshrc
if [ $machine == "Linux" ]
then
	mkdir -p ~/.config/Code/User/ && cp configs/keybindings.json configs/settings.json ~/.config/Code/User/
elif [ $machine == "Mac" ]
then
	mkdir -p ~/Library/Application\ Support/Code/User/ && cp configs/keybindings.json configs/settings.json ~/Library/Application\ Support/Code/User/
fi

# Make new ssh key for gh
echo "Creating ssh key for GitHub..."
sleep 1s
ssh-keygen  -f ~/.ssh/github

# Setup Python3 for nvim
if command -v pip3 &> /dev/null
then
	echo "Insalling python neovim..."
	sleep 1s
	pip3 install neovim
fi

# Setup nvim
if command -v nvim &> /dev/null
then
	echo "Setting up nvim..."
	sleep 1s
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +'PlugInstall --sync' +qa
fi

# Setup TeamViewer
if command -v teamviewer &> /dev/null
then
	echo "Setting up Teamviewer..."
	sleep 1s
	sudo teamviewer setup
fi

# Setup Github
if command -v gh &> /dev/null
then
	echo "Setting up GitHub..."
	sleep 1s
	gh auth login
	gh ssh-key add ~/.ssh/github.pub
fi

# Setup ohmyzsh
if command -v zsh &> /dev/null
then
	echo "Setting up OhMyZsh"
	sleep 1s
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	pip install thefuck
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	cp $SCRIPT_DIR/../configs/.zshrc ~/.zshrc
	echo "OhMyZsh installed and configured, run source ~/.zshrc to get changes"
fi
