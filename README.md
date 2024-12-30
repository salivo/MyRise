# MyRise
Arch Linux, Hyprland configuration, dotfiles
IdeaPad Pro 5 14IRH8, i7-13700H,
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

## Trobles
### Auidio
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
### Nemo extract here
Just install `nemo-fileroller`
```console
sudo pacman -S nemo-fileroller
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
