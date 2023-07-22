
gdt_start:

gdt_null:
	dq 0 ; null descriptor

gdt_code:

	dw 0xffff		; limit bits 0-15
	dw 0x0			; base bits 0-15
	db 0x0			; base bits 16-23

	db 10011010b	; flags, type flags
	db 11001111b	; flags, limit bits 16-19
	db 0x0			; base bits 24-31


gdt_data:

	dw 0xffff		; limit bits 0-15
	dw 0x0			; base bits 0-15
	db 0x0			; base bits 16-23

	db 10010010b	; flags, type flags
	db 11001111b	; flags, limit bits 16-19
	db 0x0			; base bits 24-31

gdt_end:

gdt_descriptor:
dw gdt_end - gdt_start - 1	; size of the gdt
dd gdt_start				; start address

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
