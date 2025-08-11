%include "utils/output.inc"

global parse_regex

section .text 
    ; parse_regex(char *pattern, int pattern_len)
    parse_regex:
        enter 8, 0

        mov r9, [rbp + 16]

        push 64
        push r9
        call print
        add rsp, 8*2

        leave
        ret
    

section .bss
    printing_buffer:
        .len equ 64
        resb .len
