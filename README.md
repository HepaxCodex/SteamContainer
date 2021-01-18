# SteamContainer

## Install Prerequisites

### Setup Basic System

#### Install Operating System
This setup requires Ubuntu 20.10 (podman is now part of the main package repos)

#### Install Basic Packages
Remove
* vim-tiny - No idea why this is the default in ubuntu

Install
* htop - Used to monitor system performance
* git - Version Control
* vim - Text Editor
* openssh-server - Used for remote access to server base
* podman - Used to manage containers (preffered over docker)
* buildah - Used to build containers (preffered over docker)

```bash
$ sudo apt remove vim-tiny
$ sudo apy update
$ sudo apy install htop git vim openssh-server podman buildah
```

Move Github public/private keys to ~/.ssh/




## Terraria
[Server Install Instructions](https://terraria.gamepedia.com/Server)


## Starbound


## Don't Starve Together


