# dotfiles
This repository aims to streamline the process of setting up a new development environment by providing a set of dotfiles and scripts to automate the installation of common tools and configurations.


## Installation
```sh
mkdir $HOME/repos
cd $HOME/repos
sudo xbps-install git
git clone https://github.com/garylaski/dotfiles.git 
cd dotfiles
./.local/bin/linkdotfiles
firstsetup
```

## Todo
- [ ] Github config with ssh/gpg
- [ ] Firefox config
- [ ] Replace `linkdotfiles` with `stow`
- [ ] Increased agnosticism


