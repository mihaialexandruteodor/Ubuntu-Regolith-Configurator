# Ubuntu i3 wm using Regolith

<img src="https://raw.githubusercontent.com/mihaialexandruteodor/ubuntu-i3-wm-Regolith/main/demo.png"
     alt="demo"/>

<img src="https://raw.githubusercontent.com/mihaialexandruteodor/ubuntu-i3-wm-Regolith/main/demo2.png"
     alt="demo" />

Copyright goes to Cody Setchfield for the wallpaper


Run
```
sudo apt install curl
bash <(curl -s https://raw.githubusercontent.com/mihaialexandruteodor/ubuntu-i3-wm-Regolith/main/script.sh)
```

It configures Ubuntu to use a very friendly and customisable i3wm enviorment.

Also sets up Nano,enables snaps and installs (many of which are optional, type 'y' for yes if you want them):

- [x] Allacritty terminal
- [x] VS Code
- [x] git
- [x] cmake
- [x] Sublime
- [x] Spotify
- [x] VLC
- [x] Transmission
- [x] screenfetch
- [x] wine
- [x] open-mpi
- [x] pip3
- [x] ML libs for python
- [x] Thunderbird
- [x] Chrome
- [x] Steam
- [x] vim
- [x] Midnight Commander
- [x] Plex Media Server


Regolith useful commands:

```
Mod(Win key)+Shift+? -> help
Mod+i -> autohide bar
Mod+Enter -> terminal
Mod+r -> resize mode
Mod+Shift+[number] -> send current window to [number] workspace
Mod+[number] -> go to [number] workspace
Mod+Shift+N -> open file explorer(although I encourage you to type 'mc' in the terminal and use that instead)
Mod+c -> open settings
Mod+Shift+q -> quit
Mod+Space -> seach app (intuitive if you used Macbooks before)
Mod+left/right arrow key -> select between windows
Mod+Shift+left/right arrow key -> reorder windows
```
Scroll wheel also works on bottom bar, switches workspaces

mc useful commands:
```
ctrl+x, then quickly i -> file info
tab -> switch between the two file explorer windows
```

## For those with problems with alsa audio (it defaults to hdmi/ media keys don't work on keyboards that have them):
Best course of action is to disable the hdmi profile (set it to off) in PulseAudio Volume Control, but you can also try:

1 - run
```
aplay -l
```
to find the name of the audio card that you want to control via media keys

2 - put this in ~/.asoundrc
```
pcm.!default {
    type hw
    card #
}

ctl.!default {
    type hw
    card #
}
```
where # is the name of your card

Note that this script already configures such a setting for the name Generic, which is the id of my onboard Gigabyte audio card, but your can be different
