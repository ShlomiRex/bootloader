cd ../../
nasm bootloader.asm -f bin -o boot.img
mv boot.img ~/Desktop/
qemu-system-x86_64 ~/Desktop/boot.img