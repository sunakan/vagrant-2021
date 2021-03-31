#!/bin/sh

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y \
  cifs-utils \
  vim \
  tree \
  tmux \
  make \
  tig \
  git

# Docker
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo gpasswd -a ${USER} docker

# Rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

# dust by rust
readonly DUST_URL=https://github.com/bootandy/dust/releases/download/v0.5.4/dust-v0.5.4-x86_64-unknown-linux-gnu.tar.gz
curl -L -o /tmp/dust.tar.gz https://github.com/bootandy/dust/releases/download/v0.5.4/dust-v0.5.4-x86_64-unknown-linux-gnu.tar.gz
tar -xvf /tmp/dust.tar.gz -C /tmp/
basename https://github.com/bootandy/dust/releases/download/v0.5.4/dust-v0.5.4-x86_64-unknown-linux-gnu.tar.gz | sed -e 's/\.tar\.gz$//g' | xargs -I{} sudo mv /tmp/{}/dust /usr/local/bin/ && rm -rf /tmp/dust*

## tmux
cp ./.tmux.conf ~/.tmux.conf
## dircolors
cp ./.dir_colors ~/.dir_colors
## vim
cp -rf ./.vim ~/.vim

## git
git config --global user.name "sunakan"
git config --global user.email "sunakn03@gmail.com"
git config --global core.editor vim

## Desktop
#sudo apt install -y ubuntu-desktop
