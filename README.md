# clh-arcade-cabinets
Setup instructions and scripts used for the installation and running of the CLH Arcade Cabinets.

## Laptop provisioning
The cabinets are powered by Lenovo Legion gaming laptops here is the checklist for provisioning them:
1. Install the latest version of Ubuntu (Ubuntu because NVIDIA Optimus is a pain to setup in Fedora)
2. Install the latest NVIDA driver using the command `sudo ubuntu-drivers install`
3. Using the NVIDIA control panel, make sure that PRIME is set to the performance setting to use GPU, not Intel.
4. Enable the wi-fi driver using this: 
    ```
    sudo modprobe -r ideapad_laptop
    sudo rfkill ublock all
    rfkill list
    ```
5. Make sure screen doesn't dim or blank in power settings.
6. Make sure that the latptop doesn't suspend when the lid is closed, by installing Gnome Tweaks and disable Suspend when laptop lid is closed
7. Disable automatic screen lock in Privacy settings
