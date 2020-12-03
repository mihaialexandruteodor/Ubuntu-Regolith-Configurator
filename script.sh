sudo apt-get install git

## i3

sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop i3xrocks-net-traffic i3xrocks-cpu-usage i3xrocks-time

## polybar

sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python3-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2
cd Downloads
sudo apt-get install build-essential
sudo apt-get install libjsoncpp-dev 
git clone https://github.com/jaagr/polybar.git
cd polybar && ./build.sh
cd

## Allacritty

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

## cont - Allacritty

cargo build --release
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
