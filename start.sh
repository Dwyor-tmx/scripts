#!/bin/bash

set -e
#Credit to Meghthedev for the initial script 

# init

# Run inside foss.crave.io devspace
# Remove existing local_manifests
crave run --clean --no-patch -- "rm -rf .repo/local_manifests && \

# sync repo
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags && \ 

# sync tree
git clone -b ArrowOS https://github.com/ardia-kun/device_xiaomi_fog device/xiaomi/fog && \

git clone -b thirteen https://github.com/PixelExperience/hardware_xiaomi hardware/xiaomi && \

# Set up build environment
. build/envsetup.sh && \

# Lunch configuration
lunch arrow_fog-user && \

# Build the ROM
m bacon"

# Pull generated zip files
crave pull out/target/product/*/*.zip
