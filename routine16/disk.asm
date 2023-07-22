
disk_load:

    push dx

    mov ah, 0x02 ; disk read
    mov al, dh ; sectors to read
    mov ch, 0 ; cylinder 0
    mov dh, 0 ; head 1
    mov cl, 0x02



    int 0x13
    jc disk_err

    pop dx
    cmp dh, al
    jne disk_err
    ret



disk_err:

    mov bx, DISK_ERROR
    call print16
    jmp $

    DISK_ERROR:
    db "Disk error", 0
