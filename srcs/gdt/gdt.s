32 bits

section .text
    global gdt

gdt:
    lgdt eax, [rel gdt_struct]


    inc edi

    ; gdt entry is 8byte long donc saute de 8 en 8

    ; acces aux entry par segment selector (segmenttion registers)