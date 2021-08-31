[![Made with Doom Emacs](https://img.shields.io/badge/Made_with-Doom_Emacs-blueviolet.svg?style=flat-square&logo=GNU%20Emacs&logoColor=white)](https://github.com/hlissner/doom-emacs)
[![NixOS 21.05](https://img.shields.io/badge/NixOS-v21.05-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)

My NixOS configuration. Derived heavily from [hlissner's dotfiles](https://github.com/hlissner/dotfiles).

------

| | |
|-|-|
| **Shell:** | zsh |
| **DM:** | lightdm + lightdm-mini-greeter |
| **WM:** | bspwm + polybar |
| **Editor:** | [Doom Emacs][doom-emacs] (and occasionally [vim]) |
| **Terminal:** | alacritty |
| **Launcher:** | rofi |
| **Browser:** | firefox |
| **GTK Theme:** | [Ant Dracula](https://github.com/EliverLara/Ant-Dracula) |

-----

## Quick start

1. Fetch the latest build of [NixOS 21.05][nixos].
2. Boot into the installer.
3. Setup your partitions and mount your root to `/mnt`
4. Execute the following:
5. `nix-shell -p git nixFlakes`
6. `git clone https://github.com/jamespettigrew/nixos /mnt/etc/nixos`
7. Install NixOS: `nixos-install --root /mnt --flake /mnt/etc/nixos#jupiter`
8. Reboot!
9. Change your `root` and `$USER` passwords!
