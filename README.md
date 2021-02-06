# SteamContainer

## Helpful Sites
[List of Steam App IDs](https://developer.valvesoftware.com/wiki/Dedicated_Servers_List)

[Steam CMD Setup Instructions](https://developer.valvesoftware.com/wiki/SteamCMD#Docker)

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

Below is the setupfor a starbound based config.
Change the poddata-<game> as needed for other games.

See special notes for other games.

```bash
mkdir -p <desired-path>/poddata-starbound
chmod 777 <desired-path>/poddata-starbound
podman run -d --net=host --name=starbound-container1 -v <desired-path>/poddata-starbound:/home/steam/poddata starbound-container
```

* ```-d``` Tells podman to detach (run in background)
* ```--net=host``` Tells pod to use the host computers network stack
* ```--name=steam-starbound``` Tells pod to use the name "steam-starbound"
* ```-v <host-path-to-storage>:<mount-point-in-container>``` Teslls the coontainer to use persistant storage

To Build the container (first time only)
```bash
source build.sourceme

To start the container
```bash
source start.sourceme
```

To Stop the container
```bash
source stop.sourceme
```


## Starbound
[Startboun Instructions for Ubuntu 16](https://starbounder.org/Guide:LinuxServerSetup)

* Start The Container interactively
* Install the Starbound Server to the persistent storage

```bash
host$ podman run -it --net=host --name=starbound-container1 -v /home/andrewk/Development/poddata-starbound:/home/steam/poddata starbound-container
container$ cd steamcmd
container$ ./steamcmd.sh 
steam> login <username> <password>
steam> quit
container$ steamcmd.sh +force_install_dir ~/poddata/ +app_update 211820 validate +quit
container$ exit
```

* Set CMD = ["bash"]
* Fire up the container so that you get a command prompt
* cd steamcmd
*./steamcmd.sh +login hepaxcodex +force_install_dir /home/steam/poddata +workshop_download_item 211820 729480149


[Following Instructions from here](https://steamcommunity.com/sharedfiles/filedetails/?id=734496146&searchtext=Frackin+Universe)

* Makr sure the contaner is off (source stop.sourceme)
* Download the Frackin Universe Mod as a zip
* https://github.com/sayterdarkwynd/FrackinUniverse/archive/master.zip
* Extract it to poddata-starbound/mods
* rename "FrackinUniverse" (remove the -master)
* may need to chmod 777 mods first, then chmod 755 mods


Notes if installing in an Ubuntu 20.10 Container / Host
* lib32gcc1 is now lib32gcc-s1

```bash
sudo apt-get update && \
sudo apt-get install lib32gcc-s1 libvorbisfile3 
```

## Don't Starve Together
NOT IMPLEMENTED YET

## Terraria
NOT IMPLEMENTED YET 
[Server Install Instructions](https://terraria.gamepedia.com/Server)
