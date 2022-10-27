ORG 0x7c00
BITS 16

start:
	mov si, message ; SI points to message
	call print
	jmp $

print:
	mov bx, 0 ; int 0x10 suggests BH = page number, BL = foreground color. We don't need that.
.loop:
	lodsb ; Load string from SI register into AL register. In loop, it loads char by char.
	cmp al, 0 ; When we reach null terminated char (zero) we stop.
	je .done
	call print_char
	jmp .loop
.done:
	ret

; Print char at al
print_char:
	mov ah, 0eh
	int 0x10
	ret

message: db 'Hello World!', 0

times 510-($ - $$) db 0
dw 0xAA55
