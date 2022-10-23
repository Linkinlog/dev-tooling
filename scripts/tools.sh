#!/usr/bin/env bash

sudo systemctl start sshd
sudo systemctl enable sshd

# Make directories we need for configs
mkdir ~/.config/nvim ~/.vscode ~/.ssh 2>/dev/null

# Copy configs to dirs
cp configs/init.vim ~/.config/nvim/
cp configs/keybindings.json configs/settings.json ~/.vscode


# Make new ssh key for gh
ssh-keygen  -f ~/.ssh/github

# Setup nvim
if command -v nvim &> /dev/null
then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +'PlugInstall --sync' +qa
fi

# Setup TeamViewer
if command -v teamviewer &> /dev/null
then
	sudo teamviewer setup
fi

# Setup Github
if command -v gh &> /dev/null
then
	gh auth login
	gh ssh-key add ~/.ssh/github.pub
fi

# Setup ohmyzsh
if command -v zsh &> /dev/null
then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
