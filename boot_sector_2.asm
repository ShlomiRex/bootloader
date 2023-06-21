; Create a second boot sector that contains 512 'A' and print the first 'A'.

ORG 0x7c00
BITS 16

; int 0x13 and ah=2 => read sector into memory
; We want to read diffirent sector than the boot sector, so we can extend booloading 512 bytes to 1024.
; The concept is like hard disk. Its called CHS - Cylinder, Header, Sector
; Cylinder = What platter to read
; Header = From what header to read (top, bottom)
; Sector = From what sector to read on the selected platter and header
; Youtube: https://youtu.be/3IDm_14_tAU?t=214

; C = 0, H = 0, S = 2

xor ax, ax ; Zero
mov es, ax ; We can't do operands with es, so we mov value from register ax

mov [BOOT_DISK], dl

mov ah, 2 ; Command to read sector into memory
mov al, 1 ; Number of sectors to read (512 bytes each sector)
mov ch, 0 ; Cylinder number (we in the same platter)
mov cl, 2 ; Sector number (1-63). Yes, sector number starts at 1.
mov dh, 0 ; Header number
mov dl, [BOOT_DISK] ; Drive number

; Drive number = es offset by bx = 0x7e00
; es = extra segment register and is used to reach higher number of memory location
; es * 16 + bx = 0x7e00
; 0x7e00 = 0x7c00 (origin) + 256 (boot sector size)


mov bx, 0x7e00

int 0x13

; Print what we have in the next sector
mov ah, 0x0e
mov al, [0x7e00]
int 0x10
jmp $

BOOT_DISK: db 0

times 510-($ - $$) db 0
dw 0xAA55
; Filling the second sector with 'A'
times 512 db 'A'
