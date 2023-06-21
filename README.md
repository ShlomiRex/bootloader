# How to use 

To create .img that you can use for VirtualBox / qemu:


`$ nasm examples/hello_world.asm -f bin -o boot.img`


To run in qemu:


`$ qemu-system-x86_64 boot.img`

Useful website to view all BIOS interrupts: [here](https://www.ctyme.com/intr/int.htm)

# Examples

| Example | Description |
|---|---|
| hello_world | Prints 'Hello World' onto the screen. |
| print_character | Simplest assembly code to print a single 'A' character onto screen. |
| hello_world2 | Like 'hello_world' but more simple code |
| pointer | Example of a pointer |
| echo | Reads key from keyboard and writes it to screen. |
| boot_sector_2 | Create a second boot sector that contains 512 'A'. |
|  |  |
|  |  |
|  |  |