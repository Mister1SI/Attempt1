print16:
    pusha

    print16loop:
        mov al, [bx]
        cmp al, 0
        je print16done

        mov ah, 0x0e
        int 0x10

        inc bx
        jmp print16loop

    print16done:
        popa
        ret

