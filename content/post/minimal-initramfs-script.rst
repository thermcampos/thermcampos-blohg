minimal initramfs script
=========================

.. tags: linux,kernel

After several years having Debian as my main Linux distro_, I've decided to go
back to Gentoo_, the distro who caught my attention since day one. However, my
root partition is encrypted. While Debian has an out-of-the-box solution that
makes everyone's life easier and almost transparent, Gentoo goes the opposite
way. *You* have to connect the dots and make it work *yourself*. I had to stop,
plan for a moment, and get ready.

In this short post, I'll be sharing the steps I took, the shell scripts,
and how I wired up a minimal init script, that I called initramfs_, although
it's not quite that, this is much smaller and single purposed, decrypt my
root partition.

.. _distro: https://en.wikipedia.org/wiki/Linux_distribution
.. _Gentoo: https://www.gentoo.org/
.. _initramfs: https://en.wikipedia.org/wiki/Initial_ramdisk

.. read_more

Long story short, I needed to find a way to decrypt, mount and boot my new OS
having the root partition encrypted. Using Gentoo's live-cd I was able to
try the script partially, and confirm the decryption works. All I needed was
having a busybox environment with all crypt libs on it. Using Gentoo itself
for that, I compiled some packages with **static linked** dependencies.

Then build the initial script that's going to do all the heavy-lifting.

**TL;DR**, here are the scripts:

* Create the initramfs directory, embed busybox and the crypt libs and tools on it

.. code:: bash

    #!/bin/sh
    set -e
    STAGE="${1:-/usr/src/initramfs}"

    mkdir -p "$STAGE"/{bin,sbin,lib,dev,proc,sys,mnt/root,run}

    cp /sbin/busybox "$STAGE/bin/"
    "$STAGE/bin/busybox" --install -s "$STAGE/bin"

    cp /sbin/cryptsetup "$STAGE/sbin/"
    cp /sbin/lvm "$STAGE/sbin/"

    for bin in /sbin/cryptsetup /sbin/lvm; do
        ldd "$bin" | awk '{print $3}' | grep -v '^$'
    done | sort -u | while read -r lib; do
        mkdir -p "$STAGE$(dirname "$lib")"
        cp -L "$lib" "$STAGE$lib"
    done

    cp init "$STAGE/init"
    chmod +x "$STAGE/init"

    echo "Staged tree ready at $STAGE — cd there and run the cpio|gzip packaging step."

|

* create the *init* script (it needs to be called only init) at /usr/src/initramfs

.. code:: bash

    #!/bin/sh

    rescue_shell() {
        echo "Something went wrong v3. Dropping to a shell."
        exec /bin/sh
    }

    mount -t proc none /proc
    mount -t sysfs none /sys
    mount -t devtmpfs none /dev
    mkdir -p /run/cryptsetup
    export DM_DISABLE_UDEV=1

    ROOT=$(sed -n 's/.*\broot=\([^ ]*\).*/\1/p' /proc/cmdline)

    cryptsetup luksOpen /dev/nvme0n1p3 gentoo_root || rescue_shell
    lvm vgchange -ay || rescue_shell

    mount -o ro "$ROOT" /mnt/root || rescue_shell

    exec switch_root /mnt/root /sbin/init

|

* Finally generate the image that goes to /boot and grub

.. code:: bash

    #!/bin/bash

    KERNEL="7.2.4-gentoo"

    cd /usr/src/initramfs

    find . | cpio -o -H newc | gzip > /boot/initramfs-$KERNEL.img

    grub-mkconfig -o /boot/grub/grub.cfg

|

Done. With luck, you should have a minimal setup ready to decrypt and boot
your OS. Feel free to get in touch and ask for help, if needed. I have these
scripts versioned on my personal repo, find then here: https://github.com/thermcampos/gentoo-config-files/tree/main/kernel

That's all. Thanks for reading.

