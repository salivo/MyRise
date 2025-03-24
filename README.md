# MyRise
This repository is for setting up my configuration on another PC.
However, you can also use it as an example for your own setup.
Enjoy, and feel free to ask me any questions about my configuration!

## My system
### software
Arch Linux, Hyprland,
### hardware
IdeaPad Pro 5 14IRH8, i7-13700H, Nvidia RTX 3050
### System packages
```
base linux linux-firmware iwd dhcpcd sudo git debugedit fakeroot make cmake gcc
jq wl-clipboard slurp grim imagemagick qt5-wayland qt6-wayland intel-ucode
```
### Gui system packages
```
hyprland foot wofi hyprpicker hyprlock
```
### AUR packages
```
yay
```
### User packages
```
firefox fastfetch cpufetch bpytop
```
## Useful stuff
### links
  [Awesome Hyprland](https://github.com/hyprland-community/awesome-hyprland?tab=readme-ov-file#awesome-hyprland)

## Manuals
### Displays
install `nwg-displays`
```console
pacman -S nwg-displays
```
### Audio
Install pulsewire
```console
pacman -S pipewire pipewire-audio pipewire-pulse sof-firmware wireplumber
```
Then enable and start as user unit
```console
systemctl --user enable pipewire-pulse.service
systemctl --user start pipewire-pulse.service
```
### Dark Theme
Install gnome themes
```console
pacman -S gnome-themes-extra
```
Set dark theme
```console
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```
## Nemo
### default file browser
```console
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search
```
### extract here
Just install `nemo-fileroller`
```console
sudo pacman -S nemo-fileroller
```
### preview
```console
pacman -S nemo-preview
```
### BIOS update
> For more info see [Arch Wiki](https://wiki.archlinux.org/title/Flashing_BIOS_from_Linux#Lenovo)
- Download `.exe` from [official Lenovo Website](https://pcsupport.lenovo.com/cz/cs/products/laptops-and-netbooks/5-series/ideapad-pro-5-14irh8/downloads/driver-list/component?name=BIOS%2FUEFI&id=5AC6A815-321D-440E-8833-B07A93E0428C)
- Then extract all from `DOWNLOADED.exe` with '7zip' package
```console
7z x DOWNLOADED.exe
```
- In extracted files find `WinXXXXXXXX.fd` where X is name of version
> In my case is `WinLJCN35WW.fd`
- Install `fwupdtool`
```console
pacman -S fwupd
```
- Find bios device with command
```console
fwupdtool get-devices
```
- Device name must be like `System Firmware`
> My device id is `1656480966d4f7b2f75fc5fef0c6969fc89bbcdc`
- Then update device with
```console
# fwupdtool install-blob WinXXXXXXXX.fd DEVICE-ID
```
> May sure, that you have at least 70% charged battery
### Auto starting Hyprland
I do not need multiple users so I want insted use hyprlock as login screen
so by refer to [this](https://wiki.archlinux.org/title/Getty#Virtual_console), is posible to do autologin on tty1
then [here](https://wiki.hyprland.org/Useful-Utilities/Systemd-start/#in-tty) is how properly start Hyprland
to autologin to tty1
edit `autologin.conf` with systemd drop-in file
```console
systemctl edit getty@tty1.service --drop-in=autologin
```
add this
```
[Service]
ExecStart=
ExecStart=-/sbin/agetty -o '-p -f -- \\u' --noclear --autologin username %I $TERM
```
then add it to `.zshrc` or simular based what shell you use
```
if uwsm check may-start; then
	clear
	tput civis
    exec uwsm start hyprland.desktop >/dev/null 2>&1
fi
```
### POWER
#### NVIDIA
I have nvidia-open and work pretty well I think.
> To have all power of nvidia enable and start `nvidia-powerd.service`

#### Battery
[ArchWiki](https://wiki.archlinux.org/title/Laptop/Lenovo#Lenovo)

Iprove battery life, but it goofy idk if it good
```console
echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
```
