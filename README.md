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
1. Reboot
1. On the Gnome login screen, Select "Gnome on Xorg" in sign-in options
3. In Software
    1. Click the [☰] icon and go to Update Preferences
        1. disable Automatic Updates
        1. disable Automatic Update Notifications
    1. Click the [☰] icon and go to Software Repositories
        1. enable the google-chrome repo
        2. enable the RPM Fusion - nonfree - NVIDIA Driver
4. Install some packages
    ```
    sudo dnf install nodejs gnome-tweaks xdotool google-chrome-stable screenfetch
    ``` 
1. Follow the NVIDIA Optimus guide for Fedora here: https://docs.fedoraproject.org/en-US/quick-docs/how-to-set-nvidia-as-primary-gpu-on-optimus-based-laptops/
1. Open the NVIDIA control panel
    1. go to the "PowerMizer" section and set "Preferred Mode" to "Maximum Performance"
1. Reboot
2. Verify chrome is using nvidia driver with: chrome://gpu
3. Verify WebGL performance here should have 60fps: https://threejs.org/examples/webgl_performance.html
4. In system Settings
    1. Notifications
        1. disable "Notification Popups"
    1. Privacy
        1. disable "Screen Lock"
    1. Power settings
        1. disable "Dim screen when inactive"
        1. set Blank screen to "Never"
    1. Details / Default Applications
        1. set Web to "Chrome"
5. In Tweaks 
    1. General
        1. disable "Animations"
        1. disable "Suspend when laptop lid is closed"
7. Set the background image: `wget https://www.redhat.com/cms/managed-files/clh-s3e3-desktop-1920x1080.png -O ~/Downloads/clhbg.png && gsettings set org.gnome.desktop.background picture-uri ~/Downloads/clhbg.png`
8. Install auto fullscreen (Optional, Might not work)
    1. Open chrome and go install [the gnome shell extension](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)
    1. Go to [auto fullscreen](https://extensions.gnome.org/extension/1891/auto-fullscreen/) and click the "On" slider to install it.
    1. Note: if you want to turn off the fullscreening while working on laptop setup, open Tweak tools, go to Extensions, and toggle off auto fullscreen, then turn it back on before players arrive.
9. install clh-arcade
    1. `git clone https://github.com/CommandLineHeroes/clh-arcade-games.git`
    2. `sudo npm install -g clh-arcade`
10. Set Google Chrome homepage to `localhost:1234`

## Launch CLH Arcade

1. `cd clh-arcade-games`
2. `clh-arcade`
3. Open Chrome, default homepage should be the Arcade
4. Press F11 to fullscreen
5. NOTE: Do note close the terminal from step #2 that will stop the server! Leave it running in the background.

Enjoy!

## Troubleshooting

Here are some instructions for troubleshooting various issues that have occurred in the past.

### External displays not detected

If an external display is not showing up, do the following.

 1. `sudo cp /usr/share/X11/xorg.conf.d/nvidia.conf /etc/X11/xorg.conf.d/`
 1. Edit `/etc/X11/xorg.conf.d/nvidia.conf`, go into the `OutputClass` section and add `Option "PrimaryGPU" "yes"`
 1. Save and reboot
 1. When you're back in gnome, run gnome-tweaks
 1. Go to Extensions
 1. disable the auto full screen extension
 1. Open Settings / Displays
 1. You should now see two screens! :tv::tv:
 1. Set it to mirror, and hit apply
 1. You should now have the screens mirrored from that laptop to the arcade screen
 1. Go back into gnome-tweaks
 1. Turn the auto fullscreen extension back on
 1. Last, open terminal and `cd ~/clh-arcade && clh-arcade`
 
Thanks to [spot](https://github.com/spotrh) for fixing this persistent problem!

## QR Codes for field reporting

This repo contains QR codes, one for each cabinet.  They will be printed out and affixed to the back of each cabinet.  If on-site staff find an issue with a cabinet, they can scan the QR code to send us a message about any issues with the cabinet.


## Developer notes

The QR codes were generated with the [generate-qr-codes.sh](./generate-qr-codes.sh) script.  If changes need to be made to the QR codes, edit that file and regenerate them.
