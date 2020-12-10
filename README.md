# Ubuntu i3 wm using Regolith

<img src="https://raw.githubusercontent.com/mihaialexandruteodor/ubuntu-i3-wm-Regolith/main/demo.png"
     alt="demo"/>

<img src="https://raw.githubusercontent.com/mihaialexandruteodor/ubuntu-i3-wm-Regolith/main/demo2.png"
     alt="demo" />


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

# For those with problems with alsa audio (it defaults to hdmi):
1 - run
```
cat /proc/asound/cards
```
to find the number of your audio card

2 - put this in /usr/share/alsa/alsa.conf
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
where # is the number of your card
