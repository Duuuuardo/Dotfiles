# NixOS Dotfiles

You will need to `sudo` or `sudo -i` the majority of these commands.
## Create Installation Media
1. Flash the minimal image to a USB device from Linux
`dd if=<nixos-minimal-image.iso> of=/path/to/usb bs=4M conv=fsync`
2. Boot from the USB on the target device
## Wireless Networking
1. Start wpa_supplicant > `systemctl start wpa_supplicant`
2. Enable a wireless network > `wpa_cli`
```
add_network 0
set_network 0 ssid "SSID"
set_netwwork 0 psk "PSK"
set_network 0 key_mgmt WPA-PSK
enable_network 0
```
## Partition
1. `lsblk` - to identify connected drives
2. Format the disk > `fdisk /dev/path-to-target`

3. Create a new GPT partition table > `g`
4. Create a new partition > `n`
5. Create the following structure at minimum
```
|-/dev/sda1 efi > t > 1
|-/dev/sda2 linux-filesystem 
|-/dev/sda3 swap t > 19
```
6. Write changes to disk > `w`
## Format
1. For EFI > `mkfs.fat -F 32 /dev/sda1`
2. For Primary > `mkfs.ext4 /dev/sda2`
3. For swap > `mkswap -L swap /dev/sda3` > `sudo swapon`
## Encrypted Primary
1. Format with LUKS > `cryptsetup luksFormat /dev/sda2`
2. Open with LUKS > `cryptsetup luksOpen /dev/sda2 cryptroot`
3. Format mapped cryptroot > `mkfs.ext4 -L nixos /dev/mapper/cryptroot`
## Mounting
1. Mount the primary partition to `/mnt` > `mount /dev/disk/by-label/nixos /mnt`
2. Make boot dir > `mkdir -p /mnt/boot`
3. Mount boot > `mount /dev/sda1 /mnt/boot`
## Generate configuration
1. Generate > `nixos-generate-config --root /mnt`
2. Edit `configuration.nix` > `nano /mnt/etc/nixos/configuration.nix`

## Minimal Configuration for wireless networking with wpa_supplicant
```
{ config, pkgs, ... }:
{
	imports = [ ./hardware-configuration.nix ]
	
	boot.loader.systemd-boot.enalbe = true;
	boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

	networking.wireless.enable = true;
	networking.wireless.interface = [ "interface" ];
	networking.wireless.userControlled.enable = true;

	users.users.user = {
		isNormalUser = true;
		extraGroups = [ "wheel" ];
		initialPassword = "temp123";	
	};
	system.stateVersion = "23.05";
}
```
## Enable swap in hardware-configuration.nix
```
swapDevices = [ { device = "/dev/disk/by-label/swap"; } ];
```
## Install and reboot
1. Install > `nixos-install`
2. You will be prompted for a root password afterwards.
3. Reboot > `reboot`

## How to install the dots?

  ### 1. Fetch the flake template

   ```bash
   nix flake new -t 'github:erictossell/nixflakes' ./nixflakes && cd nixflakes
   ```

   ### 2. Run the build script. 

   ```bash
   sh/build.sh
   ```
      
   a. Enter a new hostname
   
   b. Enter a new username
      
   c. Y/n for Nvidia usage.
     
   d. If you have an existing `hardware-configuration.nix` stored in `/etc/nixos` the script will ask if you would like to import it. If you have not generated one yet it will do so for you and then import it.
   
   ### 3. Initialize the git repo and add the changes
   ```bash
   git init
   git add .
   ```

   ### 4. Validate the flake imports went okay.

   ```bash
   nix flake check
   ```

   **If you havent enabled experimental features**

   ```bash
   nix flake check --extra-experimental-features nix-command --extra-experimental-features flakes
   ```
   
   ### 5. Build the system. 

   ```bash
   sudo nixos-rebuild switch --flake '.#hostname'
   ```
   **OR if your `hostname` already matches the hostname specificed in the `flake.nix`.**
   ```bash
   sudo nixos-rebuild switch --flake .
   ```