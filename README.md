# Dotfiles

These dotfiles are organized as a [Stow](https://www.gnu.org/software/stow/)
directory. Each top-level directory is a package that can be merged into a
user's home directory. Some packages depend on others.

## Core

In theory this is required for everything. In practice some things work without
it.

## Alacritty

Requires `wpg/`

System dependency: `alacritty`

## Git

System dependency: `git`

## Kak

Requires `sway/`

System dependencies: `kakoune` `kak-lsp` `git` `fzf` `st` `alacritty`

## Mpv

System dependencies: `mpv` `socat` `jq` `youtube-dl` `peerflix`

## Roarke.host

These are specific to my laptop

Sudo must be configured to allow the user to run evemu-event without a password.

System dependencies: `evemu` `pulseaudio`

## Rofi

Requires `wpg/`

System dependencies: `rofi`

## Ssh

System dependencies: `ssh` `ssh-agent` `keychain`

## Sway

System dependencies: `sway` `xwayland` `rofi` `st`

## Utils

Misc. scripts

## Waybar

Requires `sway/`

System dependencies: `waybar` `pulseaudio` `iproute2` `openvpn-client`

## Wpg

System dependencies: `wpgtk`

## Zsh

System dependencies: `zsh`
