# Command Line Heroes Arcade Cabinets

Setup instructions and scripts used for the installation and running of the CLH Arcade Cabinets.

This is the Fedora edition.  Once we're satisfied with the Fedora instructions, we can make it the default and deprecate the Ubuntu instructions.

## Laptop provisioning

The cabinets are powered by Lenovo Legion gaming laptops here is the checklist for provisioning them:



1. Make sure secure boot is disabled in the bios.  Enter bios by pressing F2 at boot.  This will fix "NVIDIA driver not found. Falling back to nouveau" warning during boot.  This step has already been done on all 5 laptops so it shouldn't need to be done again.
1. Install the latest version of Fedora
1. Update all packages
    ```
    sudo dnf update -y
    ```
1. Enable the rpmfusion repos (both free and nonfree):
    ```
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    ```
1. Install the latest NVIDA driver using the command
    ```
    sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda
    ```
1. Enable the wi-fi driver using this: 
    ```
    sudo modprobe -r ideapad_laptop
    sudo rfkill unblock all
    rfkill list
    echo 'blacklist ideapad_laptop' | sudo tee -a /etc/modprobe.d/blacklist.conf
    ```
1. Reboot
1. Using the NVIDIA control panel, go to the "PowerMizer" section and set "Preferred Mode" to "Maximum Performance"
1. Install some packages:
    ```
    sudo dnf install gnome-tweaks xdotool
    ```
1. In system Settings
    1. Notifications
        1. disable "Notification Popups"
    1. Privacy
        1. disable "Screen Lock"
    1. Power settings
        1. disable "Dim screen when inactive"
        1. set Blank screen to "Never"
1. In Tweaks 
    1. General
        1. disable "Animations"
        1. disable "Suspend when laptop lid is closed"
1. Set the background image: `wget https://www.redhat.com/cms/managed-files/clh-s3e3-desktop-1920x1080.png -O ~/Downloads/clhbg.png && gsettings set org.gnome.desktop.background picture-uri ~/Downloads/clhbg.png`
1. Install [nvm](https://github.com/nvm-sh/nvm/blob/master/README.md), install node 12, and set it as the default version of node.
    1. install nvm: `wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash`
    1. open a new terminal
    1. run this command to install nodejs 11 and make it the default version of node<br>
    `nvm install 12 && nvm alias default 12`
1. install auto fullscreen
    1. Open chrome and go install [the gnome shell extension](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)
    1. Go to [auto fullscreen](https://extensions.gnome.org/extension/1891/auto-fullscreen/) and click the "On" slider to install it.
    1. Note: if you want to turn off the fullscreening while working on laptop setup, open Tweak tools, go to Extensions, and toggle off auto fullscreen, then turn it back on before players arrive.
1. install clh-arcade
    1. `npm install -g clh-arcade`

## Extra provisioning for specific games

 - **memrecall** - needs `libjack.so.0`.  Run: `sudo dnf install jack-audio-connection-kit`
 
## Launch CLH Arcade

1. Copy onto the laptop the games you want to run.  This directory should include a `games.json` file, all the games assets, and the `.desktop` files for each game.
1. copy the `.desktop` files to `~/.local/share/applications/`
1. run the register-mimetypes script (this should be bundled with the games)
   ```
   bash register-mimetypes.sh
   ```
1. run `sudo update-desktop-database` to create launchers for each game
1. `cd` into the same folder as the `games.json` file
1. run `clh-arcade`

Enjoy!
