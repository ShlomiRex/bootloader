ORG 0x7c00
BITS 16

mov ah, 0x0e
mov bx, message ; Move the pointer of message to bx

printstring:
	mov al, [bx] ; Dereference bx (because bx is a pointer to message, we want to get the reference to that message)
	cmp al, 0
	je end
	int 0x10
	inc bx
	jmp printstring

end:
	jmp $

message: db 'We are using pointer to label and dereference it!', 0

times 510-($ - $$) db 0
dw 0xAA55
