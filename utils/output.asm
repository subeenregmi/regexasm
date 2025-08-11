%include "constants/syscalls.asm"
%include "constants/std_fd.asm"

global print

section .text
    ; print(char *buf, int buf_len)
    ; prints len bytes of buf to stdout
    print:
        enter 0, 0
        
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, [rbp + 16]
        mov rdx, [rbp + 24]
        syscall 

        leave
        ret
