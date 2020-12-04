## git

sudo apt-get install git

## i3

sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop i3xrocks-net-traffic i3xrocks-cpu-usage i3xrocks-time


## Alacritty

sudo apt-get install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
sudo apt autoremove

cd ~/Downloads
git clone https://github.com/alacritty/alacritty.git
cd alacritty
sudo apt-get install curl

# dependency: rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup override set stable
rustup update stable

## cont - Alacritty

cargo build --release
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# setting Alacritty as default terminal
mkdir -p ~/.config/regolith/i3
cp /etc/regolith/i3/config ~/.config/regolith/i3/config
sed -i 's_bindsym $mod+$i3-wm.binding.terminal exec /usr/bin/x-terminal-emulator_bindsym $mod+$i3-wm.binding.terminal exec alacritty_g' ~/.config/regolith/i3/config

# copying Alacritty config file
sudo mkdir ~/.config/alacritty
sudo cp ./alacritty.yml ~/.config/alacritty/

## nano
echo "set constantshow" >> ~/.nanorc
echo "set linenumbers" >> ~/.nanorc
echo "include \"/usr/share/nano/*.nanorc\"" >> ~/.nanorc

# enable snaps
sudo apt update
sudo apt install snapd

#cmake
sudo snap install cmake --classic

#vscode
sudo snap install code --classic

# sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text

# spotify
sudo snap install spotify

# vlc
sudo snap install vlc

# transmission
sudo apt install transmission-gtk

# screenfetch
sudo apt install screenfetch

# wine and winetricks
sudo apt install wine winetricks

# openmpi
sudo apt install openmpi-bin

# pip
sudo apt install python3-pip

# jupyterlab and ML libs
sudo pip3 install jupyterlab
sudo pip3 install numpy
sudo pip3 install sklearn
sudo pip3 install nltk
sudo pip3 install pandas


