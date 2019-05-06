# Command Line Heroes Arcade Cabinets

Setup instructions and scripts used for the installation and running of the CLH Arcade Cabinets.

## Laptop provisioning

The cabinets are powered by Lenovo Legion gaming laptops here is the checklist for provisioning them:

1. Install the latest version of Ubuntu (Ubuntu because NVIDIA Optimus is a pain to setup in Fedora)
1. Install the latest NVIDA driver using the command `sudo ubuntu-drivers install`
1. Using the NVIDIA control panel, make sure that PRIME is set to the performance setting to use GPU, not Intel.
1. Enable the wi-fi driver using this: 
    ```
    sudo modprobe -r ideapad_laptop
    sudo rfkill ublock all
    rfkill list
    echo 'blacklist ideapad_laptop' | sudo tee -a /etc/modprobe.d/blacklist.conf
    ```
1. Install some packages:
    ```
    sudo apt install chromium-browser gnome-tweaks
    ```
1. Make sure screen doesn't dim or blank in power settings.
1. Make sure that the latptop doesn't suspend when the lid is closed, by installing Gnome Tweaks and disable Suspend when laptop lid is closed
1. Disable automatic screen lock in Privacy settings
1. Disable Notifications in Settings / Notifications
