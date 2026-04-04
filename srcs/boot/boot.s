bits 32

extern handle_shell 

section .text
    global start 

start:
    mov esp, stack_top
    

    mov eax, GDT_ADDR ; 0x0xxx80
    lgdt [eax]  ; 0x
    jmp 0x08 rel
    
    
    call handle_shell


    hlt


section .bss 
align 4 ; software norm convetion pour i386 voir lien.
    stack_bottom:
        resb 4096 * 4
    stack_top:









    ; par defaut grub a un gdt en full access et nous on y accede et on le configure pour le proteger. donc rien a faire en C






; definition des section full en asm avec des dd etc dw
global_gdt:




rl_seg: 


    call handle_shell
    hlt
