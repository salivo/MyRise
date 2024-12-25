# MyRise
Arch Linux, Hyprland configuration, dotfiles

System packages
```
base linux linux-firmware iwd dhcpcd sudo git debugedit fakeroot make cmake gcc
```
Gui system packages
```
hyprland foot wofi
```
AUR packages
```
yay
```
User packages
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
pacman -S pipewire pipewire-audio pipewire-pulse sof-firmware
```
Then enable and start as user unit
```console
systemctl --user enable pipewire-pulse.service
systemctl --user start pipewire-pulse.service
```
