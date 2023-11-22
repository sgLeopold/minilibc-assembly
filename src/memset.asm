bits  64

global memset ; Declare the function as global

; Prototype => void *memset(char *str, int c, size_t n);

; str = rdi
; n = rsi
; c = rax

section .text

    memset:
        push rbp ; Save the base pointer
        mov rbp, rsp ; Set up the base pointer
        mov rax, rdi ; Copy the pointer to the destination into rax

    loop:
        cmp rdx, 0 ; Compare the count (n) with zero
        je end ; If count is zero, jump to end
        mov byte [rdi], sil ; Store the value of c (sil) at the current address in str
        inc rdi ; Move to the next byte in str
        dec rdx ; Decrement the count (n)
        jmp loop ; Jump back to the beginning of the loop

    end:
        mov rsp, rbp ; Restore the stack pointer
        pop rbp ; Pop the base pointer from the stack
        ret ; Return
