# The Acrix Operating System

Acrix is an attempt to write a 64-bit operating system in the V programming language. It is developped for the [V operating system development series](https://github.com/TRWither/v-os-tutorial).

## Features
- Framebuffer
- Booting with Limine

## Installation
1. Clone this repository
```sh
git clone https://github.com/TRWither/acrix-os
```
2. Execute the build script
```sh
cd acrix-os
chmod +x build.sh
./build.sh
```
3. An ISO image named `acrixos.iso` should have been created!

## Testing
You can run it (in QEMU for example) with this command:
```sh
qemu-system-x86_64 -cdrom acrixos.iso
```