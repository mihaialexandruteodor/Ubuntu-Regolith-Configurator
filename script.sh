# git
sudo apt install git

# variables for selection menu

allOptions=(cmake vscode sublime spotify vlc transmission open_mpi machine_learning_stuff thunderbird steam chrome)

clear

echo -e "\n"
echo "Teo's Handy Mac Setup Script.sh"
echo -e "Mihai Alexandru Teodor ©2020\n"

echo -e "################################################################\n\n"

echo -e "This script will install the i3 window manager, which you can select at login via the option in the bottom-right corner\n"
echo -e "I'll guide you all the way, remember that shell execution can be interrupted by pressing Ctrl+Z\n"

echo "First, tell me what optional packages you want:"

read -n 1 -s -r -p "Press any key to continue"
clear

selectedOptions=()

print_options(){
   echo "Do you want to install $1 ? Type y or Y for yes, anything else for no"
   read answer
    if [ "$answer" != "${answer#[Yy]}" ] ;then
        selectedOptions+=($1)
    fi
    clear
}

for i in ${!allOptions[@]};
do
  opt=${allOptions[$i]}
  print_options $opt
done

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
if [[ " ${selectedOptions[@]} " =~ "cmake" ]]; then
   sudo snap install cmake --classic
fi

#vscode
if [[ " ${selectedOptions[@]} " =~ "vscode" ]]; then
   sudo snap install code --classic
fi


# sublime
if [[ " ${selectedOptions[@]} " =~ "sublime" ]]; then
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt update
    sudo apt install sublime-text
fi

# spotify
if [[ " ${selectedOptions[@]} " =~ "spotify" ]]; then
   sudo snap install spotify
fi

# vlc
if [[ " ${selectedOptions[@]} " =~ "vlc" ]]; then
   sudo snap install vlc
fi

# transmission
if [[ " ${selectedOptions[@]} " =~ "transmission" ]]; then
   sudo snap install transmission-gtk
fi

# screenfetch
sudo apt install screenfetch

# wine 
sudo dpkg --add-architecture i386
wget -O - https://dl.winehq.org/wine-builds/winehq.key | sudo apt-key add -
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
sudo apt install --install-recommends winehq-stable

# open_mpi
if [[ " ${selectedOptions[@]} " =~ "open_mpi" ]]; then
   sudo apt install openmpi-bin
fi

# pip
sudo apt install python3-pip

# jupyterlab and ML libs
if [[ " ${selectedOptions[@]} " =~ "machine_learning_stuff" ]]; then
  sudo pip3 install jupyterlab
  sudo pip3 install numpy
  sudo pip3 install sklearn
  sudo pip3 install nltk
  sudo pip3 install pandas
  sudo pip3 install keras
  sudo pip3 install tensorflow
fi


# thunderbird
if [[ " ${selectedOptions[@]} " =~ "thunderbird" ]]; then
   sudo apt install thunderbird
fi

# steam
if [[ " ${selectedOptions[@]} " =~ "steam" ]]; then
   sudo apt install steam-installer
fi

# chrome
if [[ " ${selectedOptions[@]} " =~ "chrome" ]]; then
    cd ~/Downloads
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install ./google-chrome-stable_current_amd64.deb
    cd
fi

# vim
sudo apt install vim

# midnight commander
sudo apt install mc 

clear

echo -e "That should be all! Now lof out and, when logging back in, select Regolith as the wm, using the option in the lower right corner\n"

