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
* runc - Required by podman & buildah but not listed as a dependency in 20.10

```bash
$ sudo apt remove vim-tiny
$ sudo apy update
$ sudo apy install htop git vim openssh-server podman buildah runc
```

Move Github public/private keys to ~/.ssh/


## SteamCMD Base
```bash
podman pull steamcmd/steamcmd:latest
mkdir -p poddata-starbound
chmod 777 poddata-starbound
podman run -d --net=host --name=starbound-dedicated -v /home/andrewk/Development/poddata-starbound:/home/steam/starbound-dedicated starbound-container
```

* ```-d``` Tells podman to detach (run in background)
* ```--net=host``` Tells pod to use the host computers network stack
* ```--name=steam-starbound``` Tells pod to use the name "steam-starbound"
* ```-v <host-path-to-storage>:<mount-point-in-container>

## Terraria
[Server Install Instructions](https://terraria.gamepedia.com/Server)


## Starbound
[Startboun Instructions for Ubuntu 16](https://starbounder.org/Guide:LinuxServerSetup)

* Start The Container interactively
* Install the Starbound Server to the persistent storage

```bash
host$ podman run -it --net=host --name=starbound-dedicated -v /home/andrewk/Development/poddata-starbound:/home/steam/starbound-dedicated starbound-container
container$ cd steamcmd
container$ ./steamcmd.sh 
steam> login <username> <password>
steam> quit
container$ steamcmd.sh +force_install_dir ~/starbound-dedicated/ +app_update 211820 validate +quit
```


Notes as of Ubuntu 20.10:
* lib32gcc1 is now lib32gcc-s1

```bash
sudo apt-get update && \
sudo apt-get install lib32gcc-s1 libvorbisfile3 
```

## Don't Starve Together


