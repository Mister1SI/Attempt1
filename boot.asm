[org 0x7c00]
KERNEL_OFFSET equ 0x1000
    mov [BOOT_DRIVE], dl

    mov bp, 0x9000
    mov sp, bp

    mov bx, MSG16
    call print16

    call load_kernel

    call switch32
    jmp $

%include "routine16/print16.asm"
%include "routine16/disk.asm"
%include "switch/gdt.asm"
%include "routine32/print32.asm"
%include "switch/16to32.asm"

[bits 16]
load_kernel:
    mov bx, KERNEL_MSG
    call print16

    mov bx, KERNEL_OFFSET
    mov dh, 15
    mov dl, [BOOT_DRIVE]
    call disk_load

    ret

[bits 32]
START32:
mov ebx, MSG32
call print32

call KERNEL_OFFSET

jmp $

BOOT_DRIVE: db 0
MSG16: db "Booting in 16-bit mode", 0
MSG32: db "Booting in 32-bit mode", 0
KERNEL_MSG: db "Loading kernel", 0

times 510-($-$$) db 0
dw 0xaa55
