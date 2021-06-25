#!/usr/bin/env bash

set -e

PARTITION="/dev/sda3"
NAME="crypt"
DEVICE="/dev/mapper/$NAME"
MOUNT_POINT="/mnt/$NAME"

# create the mount point if it does not exist
if [ ! -d "$MOUNT_POINT" ]; then
    sudo mkdir -p "$MOUNT_POINT"
fi

# unmount the partition and close the device
if [ "$1" == "-u" ]; then
    sudo umount "$MOUNT_POINT"
    sudo cryptsetup close "$NAME"
    exit 0
fi

if [ -z "$CRYPT_PASSPHRASE" ]; then
    echo "ERROR: please provide the $NAME passphrase using the CRYPT_PASSPHRASE environment variable"
    exit 1
fi

# open the device and mount the partition
sudo cryptsetup open "$PARTITION" "$NAME" << EOF
$CRYPT_PASSPHRASE
EOF

sudo mount -t ext4 "$DEVICE" "$MOUNT_POINT"
sudo chown tamer.tamer "$MOUNT_POINT"

