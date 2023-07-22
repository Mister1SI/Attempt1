printhex16:
    pusha
    mov cx, 0
    printhex16loop:
        cmp cx, 4
        je printhex16done
        mov ax, dx
        and ax, 0x000f
        add al, 0x30
        cmp al, 0x39
        jle printhex16part2
        add al, 7

    printhex16part2:
        mov bx, HEX_OUT + 5
        sub bx, cx
        mov [bx], al
        ror dx, 4
        inc cx
        jmp printhex16loop

    printhex16done:
        mov bx, HEX_OUT
        call print16

        popa
        ret

HEX_OUT:
db '0x0000', 0


