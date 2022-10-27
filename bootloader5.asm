ORG 0x7c00
BITS 16

loop:
	; Read one keystroke
	mov ah, 0
	int 0x16

	; Write the keystroke back to user
	mov ah, 0x0e
	int 0x10

	jmp loop

times 510-($ - $$) db 0
dw 0xAA55
