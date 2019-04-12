# Dotfiles

These dotfiles are organized as a [Stow](https://www.gnu.org/software/stow/)
directory. Each top-level directory is a package that can be merged into a
user's home directory. Some packages depend on others.
System dependencies are usually listed by their Arch Linux package name.

## Packages

### Core

In theory this is required for everything. In practice some things work without
it.

### Alacritty

Requires `wpg/`

System dependency: `alacritty`

### Git

System dependency: `git`

### Jack

System dependency: `jack2-dbus` `cadence` `pulseaudio`

This provides a jack launcher specific to the eDAC setup on my laptop.

### Kak

Requires `sway/`

System dependencies: `kakoune` `kak-lsp` `git` `fzf` `st` `alacritty`

### Mpv

System dependencies: `mpv` `socat` `jq` `youtube-dl` `peerflix`

### Roarke.host

These are specific to my laptop

Sudo must be configured to allow the user to run evemu-event without a password.

System dependencies: `evemu` `pulseaudio`

### Rofi

Requires `wpg/`

System dependencies: `rofi`

### Ssh

System dependencies: `ssh` `ssh-agent` `keychain` `gnome-ssh-askpass2`

### Sway

System dependencies: `sway` `xwayland` `rofi` `st` `udiskie` `backlightctl`

Requires the user to be a member of group `video` (for backlight control)

### Utils

Misc. scripts

### Vscode

Requires `wpg/`

System dependencies `code-oss`

This is just wpgtk integration config, not all my vscode configuration.

### Waybar

Requires `sway/`

System dependencies: `waybar` `pulseaudio` `iproute2` `openvpn-client`

### Wpg

System dependencies: `wpgtk`

### Zsh

System dependencies: `zsh`

## Remarks

### Wpgtk config strategy

Wpgtk is a tool for generating and managing colorschemes for any program with 
normal config files. Most of the complexity of this dotfiles repo comes from the
way I handle wpgtk theming. Pretty much every config package in the repo that
configures a graphical application comes with a template file that tells wpgtk
how to configure its colorscheme. Programs with good configuration formats 
(like sway) make it possible to separate the colorscheme configuration from the
rest of the configuration in a separate file. That means that the sway
configuration works without wpgtk. Other programs like alacritty dont support
config directories, and thus need to rely of wpgtk to generate their _entire_
configuration, or else not let wpgtk configure them at all. This is annoying.

Graphical programs store their wpgtk templates in their `.config/wpg/templates`
directory, which should contain a `.base` file containing a the actual template,
and a symlink to the place where the generated configuration should be place in
the home directory.
