[org 0x7c00]

    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG16
    call print16

    call switch32 ; leave the realm of 16 bits (hopefully)


jmp $

%include "routine16/print16.asm" 
%include "routine16/printhex16.asm"
%include "routine16/disk.asm"
%include "routine32/print32.asm"
%include "switch/gdt.asm"
%include "switch/16to32.asm"

[bits 32]
START32:
    mov ebx, MSG32
    call print32

    jmp $

MSG16:
db "Started in 16 bit mode", 0
MSG32:
db "Started in 32 bit mode", 0

times 510-($-$$) db 0
dw 0xaa55

