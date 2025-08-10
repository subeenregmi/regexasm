bits 64

%include "constants/syscalls.asm"
%include "constants/flags.asm"
%include "constants/std_fd.asm"

; open_file(char *file_name) int
; takes a file_name and returns its file descriptor
open_file:
    enter 0, 0

    ; open file_name
    mov rax, SYS_OPEN 
    mov rdi, [rbp + 16]
    mov rsi, O_RDONLY
    mov rdx, 0
    syscall

    ; TODO: handle unsuccessfull 

    leave
    ret

; read_file(int fd, char *buf, int buf_len) int
; takes a fd and reads it until buffer is filled
read_file:
    enter 0, 0

    mov rax, SYS_READ
    mov rdi, [rbp + 16]
    mov rsi, [rbp + 24] 
    mov rdx, [rbp + 32]
    syscall

    leave
    ret

; print_file(char *buf, int buf_len)
; prints len bytes of buf to stdout
print_file:
    enter 0, 0
    
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, [rbp + 16]
    mov rdx, [rbp + 24]
    syscall 

    leave
    ret

; close_file(int fd) 
; closes file descriptor
close_file: 
    enter 0, 0

    mov rax, SYS_CLOSE 
    mov rdi, [rbp+16]
    syscall

    leave
    ret
    
