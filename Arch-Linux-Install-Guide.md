# Arch Linux x86_64 Installation Guide:

## Copying ISO onto USB
```
dd bs=4M if=/path/to/<file.iso> of=/dev/sd<X> conv=fsync oflag=direct status=progress
```


# Installation

Checking internet:
```shell
root@archiso# rfkill list
root@archiso# rfkill unblock <wifi> # if hard blocked
root@archiso# iwctl
[iwd]# device list
[iwd]# station <DEVICE> scan
[iwd]# station <DEVICE> get-networks
[iwd]# station <DEVICE> connect SSID
[iwd]# exit

root@archiso# ping 8.8.8.8
```
## Partitions
<details><summary> UEFI Partition</summary><br>

Verify Drives:
```shell
root@archiso# lsblk
```

Delete & List Partitions:
```shell
root@archiso# fdisk /dev/sda
  - d
  - 3
  - d
  - 2
  - d
  - 1
  - p   # list partitions
```

Create Partitions:
```shell
  - n   # new partition
  - (enter)
  - (enter)
  - +1G
  - -Y

  - n
  - (enter)
  - (enter)
  - +90G
  - Y

  - n
  - (enter)
  - (enter)
  - (enter)
  - Y

  - w   # wipe partitions
```

Verify New Partitions:
```shell
root@archiso# lsblk
```

Make filesystem:
```shell
root@archiso# mkfs.ext4 /dev/sda3
root@archiso# mkfs.ext4 /dev/sda2
root@archiso# mkfs.fat -F32 /dev/sda1
```

Mount partitions:
```shell
root@archiso# mount /dev/sda2 /mnt
root@archiso# mkdir -p /mnt/{boot,home}
root@archiso# mount /dev/sda1 /mnt/boot
root@archiso# mount /dev/sda3 /mnt/home
```

Verify Drives:
```shell
root@archiso# lsblk
```


</details>


<details><summary> LUKS Partition</summary><br>

Verify Drives:
```shell
root@archiso# lsblk
```

Delete & List Partitions:
```shell
root@archiso# gdisk /dev/sda
  - d
  - 3
  - d
  - 2
  - d
  - 1
  - p   # list partitions
```

Create Partitions:
```shell
  - n   # new partition
  - (enter)
  - (enter)
  - +512M    # 200-300M should be good
  - List
  - efi
  - ef00

  - n
  - (enter)
  - (enter)
  - (enter)
  - Y

  - w   # wipe partitions
```

Verify New Partitions:
```shell
root@archiso# lsblk
```

Encrypting Parititon:
```shell
root@archiso# cryptsetup -y -v luksFormat /dev/sda2
```

Formatting partition:
```shell
root@archiso# cryptsetup open /dev/sda2 cryptroot
```

Make filesystem:
```shell
root@archiso## cryptsetup open /dev/sda2 cryptroot
root@archiso# mkfs.ext4 /dev/mapper/cryptroot
root@archiso# mkfs.fat -F32 /dev/sda1
```

Mount partitions:
```shell
root@archiso# mount /dev/mapper/cryptroot /mnt
root@archiso# mkdir /mnt/boot
root@archiso# mount /dev/sda1 /mnt/boot
```

Verify Drives:
```shell
root@archiso# lsblk
```

</details>


## Base install 
Installing Base & Personal Packages:
```shell
root@archiso# pacstrap /mnt base base-devel linux linux-firmware linux-headers networkmanager network-manager-openvpn vim intel-ucode #amd-vcode (cpu)
```

Generating filesystem:
```shell
root@archiso# genfstab -U /mnt >> /mnt/etc/fstab
```

Moving into Arch System:
```shell
root@archiso# arch-chroot /mnt
```

Creating swap file:
```shell
sh# fallocate -l 2GB /swapfile
sh# chmod 600 /swapfile
sh# mkswap /swapfile
sh# swapon /swapfile
sh# vim /etc/fstab
  /swapfile none swap default 0 0
```

Enabling Internet:
```shell
sh# systemctl enable NetworkManager
```

Setting Timezone:
```shell
sh# ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
sh# hwclock --systohc
sh# vim /etc/locale.gen   # uncomment en_US.UTF-8 ru_RU.UTF-8
sh# locale-gen
sh# vim /etc/locale.conf  # LANG=en_US.UTF-8 LANG=ru_RU.UTF-8 LC_TIME=ru_RU.UTF-8
```

Setting Hostname and Hosts:
```shell
sh# vim /etc/hostname # <PC_NAME>
sh# vim /etc/hosts    # 127.0.0.1 localhost (\n) ::1 localhost (/n) 127.0.1.1 <PC_NAME>
```

Installing Grub:
```shell
sh# pacman -S grub efibootmgr
sh# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
sh# grub-mkconfig -o /boot/grub/grub.cfg
```

<details><summary> Additional steps / Grub for LUKS:</summary>
Setting up kernel hooks for encryption:

```shell
sh# vim /etc/mkinitcpio.conf # find hooks line
  HOOKS=(base udev autodetect keyboard keymap modconf block encrypt filesystems)
sh# mkinitcpio -p linux
```

```shell
sh# blkid
 > UUID="need-this-id"
sh# blkid |tee -a uuid 
sh# vim /etc/default/grub 
  GRUB_CMDLINE_LINUX="cryptdevice=UUID=need-this-id:cryptroot root=/dev/mapper/cryptroot"
sh# grub-mkconfig -o /boot/grub/grub.cfg
```
</details><br>

Setting Root Password:
```shell
sh# passwd  # set password
```

- Reboot

## Post Install:
Turning on NTP:
```shell
$ timedatectl set-ntp true
```

Adding User Account & Giving Sudo Priv:
```shell
$ useradd -m -s /bin/bash -g wheel <USERNAME>
$ passwd
$ vim /etc/sudoers  # uncomment: root ALL=(ALL) ALL -and- %wheel ALL=(ALL) ALL
$ groupadd plugdev
$ gpasswd -a $USER plugdev
```

Audit rules:
```shell
$ auditctl -w /etc/passwd -p rwa -k etc-passwd
$ auditctl -w /etc/shadow -p rwa -k etc-shadow
$ auditctl -w /var/log/lastlog -p rwa -k log-lastlog
```

Connecting to wifi using NetworkManager:
```shell
nmcli dev status
nmcli radio wifi
nmcli radio wifi on # if disabled
nmcli dev wifi list
nmcli dev wifi connect <network-ssid> password "<network-password>"
```

AUR package manager:
```shell
git clone https://aur.archlinux.org/paru.git /opt/
cd /opt/paru && makepkg -si 
```

Personal base programs:
```shell
$ pacman -S breeze bind bridge-utils cmake curl dnsmasq dunst feh firefox flameshot gdb git kitty libvirt lsof lxappearance man-pages mcfly neovim network-manager-applet nmap noto-fonts-cjk npm numlockx okular openvpn otf-hasklig-nerd p7zip pacman-contrib pavucontrol picom pulseaudio qemu-desktop ranger strace traceroute tree tff-font-awesome ttf-hack-nerd ttf-nerd-fonts-symbols unzip vim w3m whois wmname xclip xdg-utils xdotool yajl zathura zathura-pdf-poppler zsh
```

```shell
$ paru -S paru-debug polybar-dwm-module 
```

<details><summary>Optional base programs:</summary>

```shell
$ pacman -S acpi adobe-source-code-pro-fonts binutils bluez bluez-utils blueman btop dmidecode dnscrypt-proxy gsfonts gucharmap imagemagick jsoncpp network-manager-applet nitrogen nm-connection-manager nodejs openresolv playerctl pulseaudio-bluetooth python-yaml resolconf tldr tlp tmux ttf-fira-code ttf-jetbrains-mono xdotool xorg-xmag
```

RE/dev programs:
```shell
arp-scan capstone checksec ctags ghidra iaito jdk11-openjdk lynis nasm net-tools radare2 rkhunter valgrind wireshark-cli wireshark-qt 
```
</details><br>

Configure zsh: 
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# git clone zsh plugins into ~/.config/zsh/plugins
```

Setting default browser:
```shell 
xdg-settings set default-web-browser firefox.desktop
```

Configure firefox:
```shell
about:config #in browser url
browser.eme.ui.enabled: false
browser.tabs.closeWindowWithLastTab: false
browser.tabs.firefox-view: false
extensions.pocket.enabled: false
media.eme.enabled: false #keep true if streaming platforms break
pdfjs.disabled: true (ymmv)
toolkit.legacyUserProfileCustomizations.stylesheets = true
```

Remove Adwaita cursor theme
```shell
sudo rm -rf /usr/share/icons/Adwaita
```

Setting up new git SSH key:
```shell
ssh-keygen -t ed25519 -C "<user-email>" # save file ~/.ssh/<filename>
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub # copy key to github account settings
```

Setting git defaults:
```shell
git config --global user.name "<username>"
git config --global user.email "<user_email>"
git config --global init.defaultBranch main # default branch to main (for rust-lang)
git remote set-url --add --push origin YOUR-GIT-SSH-URL # for pushing to multiple git repos at once (dont use globally)
```

Disable Touchpad:
```shell
xinput list
xinput set-prop ## "Device Enabled" 0 # use ID number found in xinput list
```

Disable sleep/suspend/hibernate:
```shell
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

Setup wireshark for user:
```shell
sudo usermod -a -G wireshark $USER #relog
```

Configure OpenVPN:
```shell
sudo wget "https://raw.githubusercontent.com/ProtonVPN/scripts/master/update-resolv-conf.sh" -O "/etc/openvpn/update-resolv-conf"
sudo chmod +x "/etc/openvpn/update-resolv-conf"
sudo cp *.opvn /etc/openvpn/client/ # cp files to .conf
sudo cp /usr/share/openvpn/examples/client.conf /etc/openvpn/client/
nmcli connection import type openvpn file /etc/openvpn/client/<client-vpn>.ovpn
```

Enable markdown live preview with nvim:
```shell
sudo npm -g install instant-markdown-d
```

Setting grub options:
```shell
sudo vim /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"
GRUB_CMDLINE_LINUX="ipv6.disable=1"
```

Redundantly disabling IPv6:
```shell
sudo vim /tmp/ipv6-icmp.conf
net.ipv6.icmp.echo_ignore_all=1
sudo sysctl -p /tmp/ipv6-icmp.conf 
```

Enable fstrim for SSD (thinkpad)
```shell
sudo systemctl enable fstrim.timer
```

Setup bluetooth services
```shell
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
```

<details><summary>Optional setup dnscrypt proxy:</summary>

```shell
sudo vim /etc/dnscrypt-proxy/dnscrypt-proxy.toml # uncomment server_names
```

```shell
sudo vim /etc/NetworkManager/conf.d/dns.conf
[main]
dns=none
```

```shell
sudo cp /etc/resolv.conf resolv.conf.bak
sudo rm /etc/resolv.conf && nvim resolv.conf
nameserver 127.0.0.1
options edns0
````

```shell
sudo systemctl start dnscrypt-proxy.service
sudo systemctl enable dnscrypt-proxy-service
# use dnsleaktest.com to check for leaks
```
</details><br>
