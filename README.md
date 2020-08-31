To create .img that you can use for VirtualBox / qemu:


$ nasm bootloader.asm -f bin -o boot.img


To run in qemu:


$ qemu-system-x86_64 boot.img