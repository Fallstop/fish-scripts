# fish-scripts
Useful scripts to be auto loaded into path.

> Note: Only tested with Manjaro and Debian/Ubuntu, and designed for KDE


The scripts have lables of 00 (utility functions)->99 (higher level scripts) of the order they should be loaded. To disable, just remove the "XX_" prefix.

To load in all scripts (example):
```fish
#~/.config/fish/config.fish
set PROJECTS_DIR ~/Documents/projects

sed -e '$s/$/\n/' -s ~/Documents/projects/fish-scripts/bin/*_*.fish | source
```

## Dependices
 - All scripts are for fish
 - Update Script:
     - anaconda
     - yarn
     - npm
     - rustup
     - snap
     - flatpak
     - starship
     - APT (Debian Only)
     - yay (Arch Only)
     - cowsay
 - Package Ranker (Arch Only)
     - rankmirrors
 - Devscript
     - GKrak script
     - Code
 - GKrak
     - Gitkraken
 - Codin
     - "CodinGame" folder under $PROJECTS_DIR
 - Aliases
     - Cowsay
     - exa
     - yay
     - kalker
 - GUI
     - Dolphin