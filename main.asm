%include "constants/syscalls.asm"
%include "constants/flags.asm"
%include "constants/std_fd.asm"
%include "utils/files.asm"

section .text
    global _start
    _start:
        ; open input file
        push input_file 
        call open_file
        add rsp, 8
        
        ; r9 stores the input file descriptor
        mov r9, rax

        ; read input file
        push input_file_buffer.len
        push input_file_buffer 
        push r9
        call read_file
        add rsp, 24

        ; print input file
        push input_file_buffer.len
        push input_file_buffer 
        call print_file
        add rsp, 16

        ; close input file
        push r9
        call close_file
        add rsp, 8


        ; open pattern file
        push pattern_file 
        call open_file
        add rsp, 8
        
        ; r9 stores the pattern file descriptor
        mov r9, rax

        ; read the pattern file
        push pattern_file_buffer.len
        push pattern_file_buffer 
        push r9
        call read_file
        add rsp, 24


        ; print the pattern file
        push pattern_file_buffer.len
        push pattern_file_buffer 
        call print_file
        add rsp, 16

        ; close pattern file
        push r9
        call close_file
        add rsp, 8

        ; exit with error code of 0
        mov rax, SYS_EXIT
        mov rdi, 0
        syscall

section .data
    input_file:
        db "input.txt", 0
    pattern_file:
        db "pattern.txt", 0

section .rodata

section .bss
    input_file_fd:
        resb 8 

    input_file_buffer:
        .len equ 1024
        resb .len

    pattern_file_fd:
        resb 8

    pattern_file_buffer:
        .len equ 1024
        resb .len
