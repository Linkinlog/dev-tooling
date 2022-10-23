# Local Dev Tooling

### Information
This repo is aimed at automating the set up process of generic local environments.
- All the packages that will be installed are under `configs/packages.txt` 
- Running `make fedora` will install VSCode, Teamviewer, and all other packages within the package file
- Running `make tools` will start/enable ssh, make the needed dirs, copy configs, connect a smb share, add a ssh key for github, and set up neovim/teamviewer/github/ohmyzsh

### Steps to set up local dev for Fedora
- Run `make fedora`
- Run `make tools`

### Notes
- `scripts/tools.sh`L17-19 can be commented out for now

### ToDo
- Fix how the smb share is being set up so its more modular
