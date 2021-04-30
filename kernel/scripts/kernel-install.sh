#!/bin/bash
WORKING_DIR="/newkernel"
mkdir -p "$WORKING_DIR" && cd "$WORKING_DIR"

#Download & Unpack kernel
yum install -y wget
wget -v https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.115.tar.xz
tar -xvf linux-5.4.115.tar.xz
cp /boot/config* linux-5.4.115/.config
cd linux-5.4.115

# Install tooling
yum groupinstall -y "Development Tools"
yum install -y make gcc flex openssl-devel bc elfutils-libelf-devel ncurses-devel

#Compile and install kernel
make olddefconfig -j$(nproc)
make -j$(nproc)
make modules_install -j$(nproc)
make install -j$(nproc)
rm -f /boot/*3.10*
grub2-mkconfig -o /boot/grub2/grub.cfg 
grub2-set-default 0
echo "Grub update done."
# Reboot VM
shutdown -r now
