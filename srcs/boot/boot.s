bits 32

extern handle_shell 

section .text
    global start

start:
    mov esp, stack_top
    call handle_shell
    ;mov byte [0xB8000], '4'
   ; mov byte [0xB8001], 0x0F
    ;mov byte [0xB8002], '2'
    ;mov byte [0xB8003], 0x0F
    hlt


section .bss
    stack_bottom:
        resb 4096 * 4
    stack_top:
